class Joueur < ApplicationRecord
  has_many :paiements, dependent: :destroy
  has_many :assurances, dependent: :destroy
  has_many :achats, dependent: :destroy
  belongs_to :parent, optional: true
  belongs_to :groupe, optional: true

  def somme_des_credits
    credits_paiements = paiements.where(etat_abonnement: 'Crédit').sum(:montant).to_i
    credits_assurances = assurances.joins(:saison).where(etat_paiement: 'Crédit').sum('saisons.montant_assurance').to_i
    credits_achats = achats.where(etat_paiement: 'Crédit').sum(:prix).to_i
    
    credits_paiements + credits_assurances + credits_achats
  end
end
