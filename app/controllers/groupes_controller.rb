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
    if @groupe.save
      redirect_to @groupe, notice: "Le groupe a été créé avec succès."
    else
      render :new
    end
  end

  def edit
    @entraineurs = Entraineur.all
  end

  def update
    if @groupe.update(groupe_params)
      redirect_to @groupe, notice: "Le groupe a été mis à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @groupe.destroy
    redirect_to groupes_path, notice: "Le groupe a été supprimé avec succès."
  end

  private

  def set_groupe
    @groupe = Groupe.find(params[:id])
  end

  def groupe_params
    params.require(:groupe).permit(:heure_debut, :heure_fin, :jour, :terrain, :age_min, :age_max, :entraineur_id)
  end
end
