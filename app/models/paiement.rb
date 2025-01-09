class Paiement < ApplicationRecord
  belongs_to :joueur
  validates :etat_abonnement, inclusion: {
    in: [ "Non crédit", "Crédit" ],
    message: "%{value} n'est pas un état valide"
  }
end
