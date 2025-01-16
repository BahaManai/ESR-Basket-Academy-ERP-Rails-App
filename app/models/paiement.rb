class Paiement < ApplicationRecord
  belongs_to :joueur
  validates :etat_abonnement, inclusion: {
    in: [ "Non crédit", "Crédit" ],
    message: "%{value} n'est pas un état valide"
  }
  validates :montant, presence: true
  validates :date_abonnement, presence: true
end
