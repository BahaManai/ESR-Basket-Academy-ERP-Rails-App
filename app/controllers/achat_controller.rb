class AchatController < ApplicationController
  before_action :set_achat, only: %i[destroy update]

  def index
    @achats = Achat.all
  end

  def show
  end

  def create
    @achat = Achat.new(achat_params)

    respond_to do |format|
      if @achat.save
        format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", notice: "Achat was successfully created." }
        format.json { render json: @achat, status: :created }
      else
        format.html { redirect_to achats_path, alert: "Failed to create Achat." }
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    if @achat.update(achat_params)
      redirect_to achats_path, notice: "L'état de paiement a été mis à jour."
    else
      redirect_to achats_path, alert: "Une erreur est survenue lors de la mise à jour."
    end
  end

  def destroy
    @achat.destroy!
    respond_to do |format|
      format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", status: :see_other, notice: "Achat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_achat
    @achat = Achat.find(params[:id])
  end

  def achat_params
    params.require(:achat).permit(:designation, :prix, :date_achat,  :etat_paiement, :joueur_id)
  end
end
