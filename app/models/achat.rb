class Achat < ApplicationRecord
  belongs_to :joueur
  validates :etat_paiement, inclusion: {
  in: [ "Non crédit", "Crédit" ],
  message: "%{value} n'est pas un état valide"
  }
  validates :designation, presence: true
  validates :prix, presence: true
  validates :date_achat, presence: true
end
