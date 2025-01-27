require "csv"
class JoueursController < ApplicationController
  before_action :set_joueur, only: %i[ edit update destroy ]

  # GET /joueurs or /joueurs.json
  def index
    @joueurs = case params[:filter]
    when "active"
      Joueur.joins(:paiements).where(
        "date(paiements.date_abonnement, '+30 days') >= ? AND paiements.id = (
          SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = joueurs.id
        )",
        Date.today
      )
    when "expired"
      Joueur.joins(:paiements).where(
        "date(paiements.date_abonnement, '+30 days') < ? AND paiements.id = (
          SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = joueurs.id
        )",
        Date.today
      )
    when "credit"
      Joueur.joins("LEFT JOIN paiements ON paiements.joueur_id = joueurs.id")
            .joins("LEFT JOIN assurances ON assurances.joueur_id = joueurs.id")
            .joins("LEFT JOIN achats ON achats.joueur_id = joueurs.id")
            .group("joueurs.id")
            .having(
              "SUM(CASE WHEN paiements.etat_abonnement = 'Crédit' THEN paiements.montant ELSE 0 END) +
               SUM(CASE WHEN assurances.etat_paiement = 'Crédit' THEN assurances.montant ELSE 0 END) +
               SUM(CASE WHEN achats.etat_paiement = 'Crédit' THEN achats.prix ELSE 0 END) > 0"
            )
    else
      Joueur.all
    end
    @saison = Saison.actuelle
  end


  # GET /joueurs/new
  def new
    @joueur = Joueur.new
    @parent = Parent.new
  end

  # GET /joueurs/1/edit
  def edit
    @joueur = Joueur.find(params[:id])
    @paiement = Paiement.new
    @assurance = Assurance.new
    @achat = Achat.new
    @saison = Saison.actuelle
    @used_seasons = Assurance.where(joueur_id: @joueur.id).pluck(:saison_id)
    @next_num_recu = Paiement.last.num_recu + 1
  end

  # POST /joueurs or /joueurs.json
  def create
    @joueur = Joueur.new(joueur_params)

    respond_to do |format|
      if @joueur.save
        format.html { redirect_to "/joueurs/#{@joueur.id}/edit", notice: "Le joueur a été créé avec succès." }
        format.json { render :show, status: :created, location: @joueur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @joueur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joueurs/1 or /joueurs/1.json
  def update
    respond_to do |format|
      if @joueur.update(joueur_params)
        format.html { redirect_to joueurs_path, notice: "Le joueur a été mis à jour avec succès." }
        format.json { render :edit, status: :ok, location: @joueur }
      else
        format.html do
          error_messages = @joueur.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en modification de joueur :</h2><ul>#{error_messages}</ul>"

          redirect_to edit_joueur_path, alert: alert_message.html_safe
        end
        format.json { render json: @joueur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joueurs/1 or /joueurs/1.json
  def destroy
    @joueur.destroy!

    respond_to do |format|
      format.html { redirect_to joueurs_path, status: :see_other, notice: "Le joueur a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  def export_csv
    @saison = Saison.actuelle
    @records = case params[:filter]
    when "active"
        Joueur.joins(:paiements).where(
          "date(paiements.date_abonnement, '+30 days') >= ? AND paiements.id = (
            SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = joueurs.id
          )",
          Date.today
        )
    when "expired"
        Joueur.joins(:paiements).where(
          "date(paiements.date_abonnement, '+30 days') < ? AND paiements.id = (
            SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = joueurs.id
          )",
          Date.today
        )
    when "credit"
        Joueur.joins("LEFT JOIN paiements ON paiements.joueur_id = joueurs.id")
              .joins("LEFT JOIN assurances ON assurances.joueur_id = joueurs.id")
              .joins("LEFT JOIN achats ON achats.joueur_id = joueurs.id")
              .group("joueurs.id")
              .having(
                "SUM(CASE WHEN paiements.etat_abonnement = 'Crédit' THEN paiements.montant ELSE 0 END) +
                SUM(CASE WHEN assurances.etat_paiement = 'Crédit' THEN assurances.montant ELSE 0 END) +
                SUM(CASE WHEN achats.etat_paiement = 'Crédit' THEN achats.prix ELSE 0 END) > 0"
              )
    else
        Joueur.all
    end

    @records = @records.includes(:paiements).sort_by(&:prénom)

    csv_data = CSV.generate(headers: true) do |csv|
      csv << [ "Nom du joueur", "Dernier abonnement", "Date d'encaissement", "Date d'expiration", "Assurance", "Credits" ]

      @records.each do |record|
        dernier_paiement = record.paiements.last
        assurance_status = if record.assurances.any? { |assurance| assurance.saison_id == @saison.id }
                             assurance_actuelle = record.assurances.find { |assurance| assurance.saison_id == @saison.id }
                             assurance_actuelle.etat_paiement == "Crédit" ? "Credit" : "Payee"
        else
                             "Non payee"
        end

        csv << [
          "#{record.prénom} #{record.nom}",
          (dernier_paiement ? "#{dernier_paiement.date_abonnement.strftime('%d/%m/%Y')} (#{dernier_paiement.montant.to_i} DT)" : "Aucun paiement"),
          (dernier_paiement&.date_encaissement ? dernier_paiement.date_encaissement.strftime("%d/%m/%Y") : ""),
          (dernier_paiement ? (dernier_paiement.date_abonnement + 30.days).strftime("%d/%m/%Y") : ""),
          assurance_status,
          "#{record.somme_des_credits} DT"
        ]
      end
    end

    respond_to do |format|
      format.csv { send_data csv_data, filename: "ESR_Academy_#{params[:filter]}Joueurs-#{Date.today}.csv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joueur
      @joueur = Joueur.find(params.expect(:id))
    end

    def latest_saison
      Saison.last || Saison.new
    end

    # Only allow a list of trusted parameters through.
    def joueur_params
      params.expect(joueur: [ :nom, :prénom, :sexe, :date_naissance, :note, :parent_id, :groupe_id ])
    end
end
