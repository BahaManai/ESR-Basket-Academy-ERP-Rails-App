class Paiement < ApplicationRecord
  belongs_to :joueur
  validates :etat_abonnement, inclusion: {
    in: [ "Active", "Expiré", "Crédit" ],
    message: "%{value} n'est pas un état valide"
  }
end
