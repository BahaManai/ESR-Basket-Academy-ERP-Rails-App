class ParentsController < ApplicationController
  before_action :set_parent, only: %i[ edit update destroy ]

  # GET /parents or /parents.json
  def index
    @parents = Parent.all
    @saison = Saison.actuelle
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents or /parents.json
  def create
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save
        format.html { redirect_to new_joueur_path, notice: "Le parent a été créé avec succès." }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1 or /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to parents_path, notice: "Le parent a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1 or /parents/1.json
  def destroy
    @parent.destroy!

    respond_to do |format|
      format.html { redirect_to parents_path, status: :see_other, notice: "Le parent a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def parent_params
      params.expect(parent: [ :nom, :prénom, :téléphone ])
    end
end
