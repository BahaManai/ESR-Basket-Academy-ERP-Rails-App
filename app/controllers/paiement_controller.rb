class PaiementController < ApplicationController
  before_action :set_paiement, only: %i[ destroy ]
  def index
    @paiements = Paiement.all
  end

  def show
  end

  def create
    @paiement = Paiement.new(paiement_params)

    respond_to do |format|
      if @paiement.save
        format.html { redirect_to "/joueurs/#{@paiement.joueur_id}/edit", notice: "Paiement was successfully created." }
        format.json { render :show, status: :created, location: @paiement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
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
    params.require(:paiement).permit(:montant, :date_abonnement, :date_encaissement,  :etat_abonnement, :joueur_id)
  end
end
