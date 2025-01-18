class EntraineursController < ApplicationController
  before_action :set_entraineur, only: %i[ edit update destroy ]

  # GET /entraineurs or /entraineurs.json
  def index
    @entraineurs = Entraineur.all
  end

  # GET /entraineurs/new
  def new
    @entraineur = Entraineur.new
  end

  # GET /entraineurs/1/edit
  def edit
    @entraineur = Entraineur.find(params[:id])
    @salaire = Salaire.new

    dernier_salaire = @entraineur.salaires.last
    if dernier_salaire
      prochain_mois = (Date.new(dernier_salaire.annee, dernier_salaire.mois, 1) >> 1)
      @mois_par_defaut = prochain_mois.month
      @annee_par_defaut = prochain_mois.year
    else
      @mois_par_defaut = Date.current.month
      @annee_par_defaut = Date.current.year
    end
  end


  # POST /entraineurs or /entraineurs.json
  def create
    @entraineur = Entraineur.new(entraineur_params)

    respond_to do |format|
      if @entraineur.save
        format.html { redirect_to "/entraineurs/#{@entraineur.id}/edit", notice: "L'entraîneur a été créé avec succès." }
        format.json { render :show, status: :created, location: @entraineur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entraineur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entraineurs/1 or /entraineurs/1.json
  def update
    respond_to do |format|
      if @entraineur.update(entraineur_params)
        format.html { redirect_to entraineurs_path, notice: "L'entraîneur a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @entraineur }
      else
        format.html do
          error_messages = @entraineur.errors.full_messages.map { |msg| "<li style='list-style-type: none;'><i class='bi bi-exclamation-triangle-fill'></i>&nbsp;#{msg}</li>" }.join
          alert_message = "<h2>Erreur en modification de l'entraîneur :</h2><ul>#{error_messages}</ul>"

          redirect_to edit_entraineur_path, alert: alert_message.html_safe
        end
        format.json { render json: @entraineur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entraineurs/1 or /entraineurs/1.json
  def destroy
    @entraineur.destroy!

    respond_to do |format|
      format.html { redirect_to entraineurs_path, status: :see_other, notice: "L'entraîneur a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entraineur
      @entraineur = Entraineur.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def entraineur_params
      params.expect(entraineur: [ :nom, :prénom, :téléphone, :salaire ])
    end
end
