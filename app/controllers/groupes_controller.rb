class GroupesController < ApplicationController
  before_action :set_groupe, only: %i[edit update destroy]

  def index
    @groupes = Groupe.includes(:entraineur).all
    @groupes_joueurs_count = Groupe.joins(:joueurs)
                                .group("groupes.id")
                                .select("groupes.age_min, groupes.age_max, COUNT(joueurs.id) as joueurs_count")
                                .map { |groupe| [ "#{groupe.age_min}-#{groupe.age_max} ans", groupe.joueurs_count ] }
    @saison = Saison.actuelle
  end

  def new
    @groupe = Groupe.new
    @entraineurs = Entraineur.all
  end

  def create
    @groupe = Groupe.new(groupe_params)
    respond_to do |format|
      if @groupe.save
        format.html { redirect_to groupes_path, notice: "Le groupe a été créé avec succès." }
        format.json { render :show, status: :created, location: @groupe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @groupe.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @groupe.update(groupe_params)
        format.html { redirect_to groupes_path, notice: "Le groupe a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @groupe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @groupe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @groupe.destroy!

    respond_to do |format|
      format.html { redirect_to groupes_path, status: :see_other, notice: "Le groupe a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private

  def set_groupe
    @groupe = Groupe.find(params.expect(:id))
  end

  def groupe_params
    params.expect(groupe: [ :heure_debut, :heure_fin, :jour, :terrain, :age_min, :age_max, :entraineur_id ])
  end
end
