class Achat < ApplicationRecord
  belongs_to :joueur
  validates :etat_paiement, inclusion: {
  in: [ "Non crédit", "Crédit" ],
  message: "%{value} n'est pas un état valide"
  }
  validates :designation, presence: true
  validates :prix, numericality: { greater_than_or_equal_to: 0 }
  validates :num_recu, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :date_achat, presence: true, comparison: { less_than_or_equal_to: Date.today }
end
