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
  end

  # POST /joueurs or /joueurs.json
  def create
    @joueur = Joueur.new(joueur_params)

    respond_to do |format|
      if @joueur.save
        format.html { redirect_to "/joueurs/#{@joueur.id}/edit", notice: "Joueur was successfully created." }
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
        format.html { redirect_to joueurs_path, notice: "Joueur was successfully updated." }
        format.json { render :show, status: :ok, location: @joueur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @joueur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joueurs/1 or /joueurs/1.json
  def destroy
    @joueur.destroy!

    respond_to do |format|
      format.html { redirect_to joueurs_path, status: :see_other, notice: "Joueur was successfully destroyed." }
      format.json { head :no_content }
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
      params.expect(joueur: [ :nom, :prénom, :sexe, :date_naissance, :note, :parent_id ])
    end
end
