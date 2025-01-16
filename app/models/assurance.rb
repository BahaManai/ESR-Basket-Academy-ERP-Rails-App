class Assurance < ApplicationRecord
  belongs_to :joueur
  belongs_to :saison
  validates :montant, numericality: { greater_than_or_equal_to: 0 }
  validates :etat_paiement, inclusion: {
  in: [ "Non crédit", "Crédit" ],
  message: "%{value} n'est pas un état valide"
  }
  validates :date_paiement, presence: true
  validates :saison, uniqueness: { scope: [ :joueur ], message: ": Une assurance de cette saison existe déjà pour ce joueur" }
end
