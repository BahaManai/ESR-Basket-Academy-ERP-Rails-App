class Paiement < ApplicationRecord
  belongs_to :joueur
  validates :etat_abonnement, inclusion: {
    in: [ "Non crédit", "Crédit" ],
    message: "%{value} n'est pas un état valide"
  }
  validates :montant, numericality: { greater_than_or_equal_to: 0 }
  validates :date_abonnement, presence: true, comparison: { less_than_or_equal_to: Date.today }
  validates :num_recu, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :date_encaissement, comparison: { less_than_or_equal_to: Date.today }, allow_blank: true
end
