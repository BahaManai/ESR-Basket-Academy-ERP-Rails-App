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
  end

  # POST /entraineurs or /entraineurs.json
  def create
    @entraineur = Entraineur.new(entraineur_params)

    respond_to do |format|
      if @entraineur.save
        format.html { redirect_to entraineurs_path, notice: "Entraineur was successfully created." }
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
        format.html { redirect_to entraineurs_path, notice: "Entraineur was successfully updated." }
        format.json { render :show, status: :ok, location: @entraineur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entraineur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entraineurs/1 or /entraineurs/1.json
  def destroy
    @entraineur.destroy!

    respond_to do |format|
      format.html { redirect_to entraineurs_path, status: :see_other, notice: "Entraineur was successfully destroyed." }
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
