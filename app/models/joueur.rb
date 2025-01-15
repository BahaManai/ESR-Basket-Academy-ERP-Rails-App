class Joueur < ApplicationRecord
  has_many :paiements, dependent: :destroy
  has_many :assurances, dependent: :destroy
  has_many :achats, dependent: :destroy
  belongs_to :parent, optional: true
  belongs_to :groupe, optional: true

  validates :nom, presence: true
  validates :prénom, presence: true
  validates :sexe, presence: true
  validates :parent_id, presence: true
  validates :date_naissance, comparison: { less_than: Date.today }, allow_blank: true

  def somme_des_credits
    credits_paiements = paiements.where(etat_abonnement: "Crédit").sum(:montant).to_i
    credits_assurances = assurances.where(etat_paiement: "Crédit").sum(:montant).to_i
    credits_achats = achats.where(etat_paiement: "Crédit").sum(:prix).to_i

    credits_paiements + credits_assurances + credits_achats
  end
end
