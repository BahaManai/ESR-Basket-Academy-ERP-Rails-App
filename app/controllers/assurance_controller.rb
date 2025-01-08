class AssuranceController < ApplicationController
  before_action :set_assurance, only: %i[destroy]

  def index
    @assurances = Assurance.all
  end

  def show
  end

  def create
    @assurance = Assurance.new(assurance_params)

    respond_to do |format|
      if @assurance.save
        format.html { redirect_to "/joueurs/#{@assurance.joueur_id}/edit", notice: "L'assurance a été créée avec succès." }
        format.json { render :show, status: :created, location: @assurance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assurance.errors, status: :unprocessable_entity }
      end
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
    params.require(:assurance).permit(:date_paiement, :joueur_id, :saison_id)
  end
end
