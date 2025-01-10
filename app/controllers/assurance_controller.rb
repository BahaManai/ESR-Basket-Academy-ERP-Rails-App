class AssuranceController < ApplicationController
  before_action :set_assurance, only: %i[destroy update]

  def index
    @assurances = case params[:filter]
    when "credit"
      Assurance.where(etat_paiement: "Crédit")
    else
      Assurance.all
    end
  end

  def show
  end

  def create
    @assurance = Assurance.new(assurance_params)

    respond_to do |format|
      if @assurance.save
        format.html { redirect_to "/joueurs/#{@assurance.joueur_id}/edit", notice: "L'assurance a été créée avec succès." }
        format.json { render json: @assurance, status: :created }
      else
        format.html { redirect_to assurances_path, alert: "Échec de la création de l'assurance." }
        format.json { render json: @assurance.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    if @assurance.update(assurance_params)
      redirect_to assurances_path, notice: "L'état de paiement a été mis à jour."
    else
      redirect_to assurances_path, alert: "Une erreur est survenue lors de la mise à jour."
    end
  end

  def destroy
    @assurance.destroy!
    respond_to do |format|
      format.html { redirect_to "/joueurs/#{@assurance.joueur_id}/edit", status: :see_other, notice: "L'assurance a été supprimée avec succès." }
      format.json { head :no_content }
    end
  end

  private

  def set_assurance
    @assurance = Assurance.find(params[:id])
  end

  def assurance_params
    params.require(:assurance).permit(:date_paiement,  :etat_paiement, :joueur_id, :saison_id)
  end
end
