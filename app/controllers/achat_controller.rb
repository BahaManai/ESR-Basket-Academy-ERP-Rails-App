class AchatController < ApplicationController
  before_action :set_achat, only: %i[destroy]

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
        format.json { render :show, status: :created, location: @achat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
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
    params.require(:achat).permit(:designation, :prix, :date_achat, :joueur_id)
  end
end
