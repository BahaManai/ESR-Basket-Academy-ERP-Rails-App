class Paiement < ApplicationRecord
  belongs_to :joueur
  validates :etat_abonnement, inclusion: {
    in: [ "Non crédit", "Crédit" ],
    message: "%{value} n'est pas un état valide"
  }
  validates :montant, numericality: { greater_than_or_equal_to: 0 }
  validates :date_abonnement, presence: true
  validates :num_recu, presence: true
end
