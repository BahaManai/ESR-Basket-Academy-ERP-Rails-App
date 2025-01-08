class Joueur < ApplicationRecord
  has_many :paiements, dependent: :destroy
  has_many :assurances, dependent: :destroy
  has_many :achats, dependent: :destroy
  belongs_to :parent, optional: true
  belongs_to :groupe, optional: true
end
