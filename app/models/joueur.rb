class Joueur < ApplicationRecord
  has_many :paiements, dependent: :destroy
  has_many :assurances, dependent: :destroy
  has_many :achats, dependent: :destroy
  has_many :credits, dependent: :destroy
end
