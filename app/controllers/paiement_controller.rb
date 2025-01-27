require "csv"
class PaiementController < ApplicationController
  before_action :set_paiement, only: %i[edit destroy update]
  def index
    # trouver l'identifiant maximum du dernier paiement (MAX(p2.id)) pour chaque joueur.
    @paiements = case params[:filter]
    when "active"
      Paiement.joins(:joueur).where(
        "date(paiements.date_abonnement, '+30 days') >= ? AND paiements.id = (
          SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = paiements.joueur_id
        )",
        Date.today
        )
    when "expired"
      Paiement.joins(:joueur).where(
        "date(paiements.date_abonnement, '+30 days') < ? AND paiements.id = (
          SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = paiements.joueur_id
        )",
        Date.today
        )
    when "credit"
      Paiement.where(etat_abonnement: "Crédit")
    else
      Paiement.all
    end
  end


  def show
  end

  def create
    @paiement = Paiement.new(paiement_params)

    respond_to do |format|
      if @paiement.save
        format.html { redirect_to "/joueurs/#{@paiement.joueur_id}/edit", notice: "L'abonnement a été créé avec succès." }
        format.json { render json: @paiement, status: :created }
      else
        format.html do
          error_messages = @paiement.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en ajout de paiement :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@paiement.joueur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @paiement.update(paiement_params)
        format.html { redirect_to "/joueurs/#{@paiement.joueur_id}/edit", notice: "L'abonnement a été mis à jour avec succès." }
        format.json { render :edit, status: :ok, location: @paiement }
      else
        format.html do
          error_messages = @paiement.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur lors de la mise à jour de paiement :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@paiement.joueur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paiement.destroy!
    respond_to do |format|
      format.html { redirect_to "/joueurs/#{@paiement.joueur_id}/edit", status: :see_other, notice: "L'abonnement a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  def export_csv
    @records = case params[:filter]
    when "active"
      Paiement.joins(:joueur).where(
        "date(paiements.date_abonnement, '+30 days') >= ? AND paiements.id = (
          SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = paiements.joueur_id
        )",
        Date.today
        )
    when "expired"
      Paiement.joins(:joueur).where(
        "date(paiements.date_abonnement, '+30 days') < ? AND paiements.id = (
          SELECT MAX(p2.id) FROM paiements p2 WHERE p2.joueur_id = paiements.joueur_id
        )",
        Date.today
        )
    when "credit"
      Paiement.where(etat_abonnement: "Crédit")
    else
      Paiement.all
    end

    csv_data = CSV.generate(headers: true) do |csv|
      csv << [ "Nom du joueur", "Date d'abonnement", "Montant", "Numero de recu", "Etat de paiement" ]
      @records.reverse.each do |record|
        etat_abonnement = case record.etat_abonnement
        when "Crédit"
              "Credit"
        when "Non crédit"
              "Non credit"
        end
        csv << [ "#{record.joueur.prénom} #{record.joueur.nom}",
                record.date_abonnement,
                "#{record.montant} DT",
                record.num_recu,
                etat_abonnement ]
      end
    end
    respond_to do |format|
      format.csv { send_data csv_data, filename: "ESR_Academy_#{params[:filter]}Paiements-#{Date.today}.csv" }
    end
  end


  private

  def set_paiement
    @paiement = Paiement.find(params[:id])
  end

  def paiement_params
    params.require(:paiement).permit(:montant, :date_abonnement, :date_encaissement,  :etat_abonnement, :num_recu, :joueur_id)
  end
end
