class PaiementController < ApplicationController
  before_action :set_paiement, only: %i[ destroy update]
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
        format.html { redirect_to "/joueurs/#{@paiement.joueur_id}/edit", notice: "Paiement was successfully created." }
        format.json { render json: @paiement, status: :created }
      else
        format.html { redirect_to paiements_path, alert: "Failed to create Paiement." }
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @paiement.update(paiement_params)
      redirect_to paiements_path, notice: "L'état de paiement a été mis à jour."
    else
      redirect_to paiements_path, alert: "Une erreur est survenue lors de la mise à jour."
    end
  end

  def destroy
    @paiement.destroy!
    respond_to do |format|
      format.html { redirect_to "/joueurs/#{@paiement.joueur_id}/edit", status: :see_other, notice: "Paiement was successfully destroyed." }
      format.json { head :no_content }
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
