class DashbordController < ApplicationController
  def index
    @total_depenses = Depense.sum(:prix)
    @total_salaires = Salaire.sum(:salaire)
    @total_salaires_2025 = Salaire.where(annee: 2025).sum(:salaire)
    @total_salaires_2025_2 = Salaire.where(annee: 2025, mois: 2).sum(:salaire)
    @nb_joueurs = Joueur.count
    @nb_joueurs_2025 = Joueur.where(created_at: Date.new(2025)..Date.new(2025, 12, 31)).count
  end
end
