class SalaireController < ApplicationController
  before_action :set_salaire, only: %i[ destroy ]

  def index
    @salaires = Salaire.all
  end

  def show
    # Your show logic here
  end

  def new
    @salaire = Salaire.new
  end

  def create
    @salaire = Salaire.new(salaire_params)

    respond_to do |format|
      if @salaire.save
        format.html { redirect_to "/entraineurs/#{@salaire.entraineur_id}/edit", notice: "Salaire was successfully created." }
        format.json { render json: @salaire, status: :created }
      else
        format.html do
          error_messages = @salaire.errors.full_messages.map { |msg| "<li style= 'list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en ajout de salaire :</h2><ul>#{error_messages}</ul>"

          redirect_to "/entraineurs/#{@salaire.entraineur_id}/edit", alert: alert_message.html_safe
        end
        format.json { render json: @salaire.errors, status: :unprocessable_entity }
      end
    end
  end




  def destroy
    @salaire.destroy!
    respond_to do |format|
      format.html { redirect_to "/entraineurs/#{@salaire.entraineur_id}/edit", status: :see_other, notice: "Salaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_salaire
    @salaire = Salaire.find(params[:id])
  end

  def salaire_params
    params.require(:salaire).permit(:salaire, :mois, :annee, :entraineur_id)
  end
end
