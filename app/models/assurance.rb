class Assurance < ApplicationRecord
  belongs_to :joueur
  belongs_to :saison
  validates :etat_paiement, inclusion: {
  in: [ "Non crédit", "Crédit" ],
  message: "%{value} n'est pas un état valide"
  }
end
