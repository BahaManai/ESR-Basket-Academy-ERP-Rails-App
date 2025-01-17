class AchatController < ApplicationController
  before_action :set_achat, only: %i[destroy update]

  def index
    @achats = Achat.all
  end

  def index
    @achats = case params[:filter]
    when "credit"
      Achat.where(etat_paiement: "Crédit")
    else
      Achat.all
    end
  end

  def show
  end

  def create
    @achat = Achat.new(achat_params)

    respond_to do |format|
      if @achat.save
        format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", notice: "L'achat a été créé avec succès." }
        format.json { render json: @achat, status: :created }
      else
        format.html do
          error_messages = @achat.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en ajout d'achat :</h2><ul>#{error_messages}</ul>"

          redirect_to "/joueurs/#{@achat.joueur_id}/edit", alert: alert_message.html_safe
        end
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
      format.html { redirect_to "/joueurs/#{@achat.joueur_id}/edit", status: :see_other, notice: "L'achat a été supprimé avec succès." }
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
