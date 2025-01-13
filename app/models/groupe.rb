class Groupe < ApplicationRecord
  has_many :joueurs, dependent: :destroy
  belongs_to :entraineur
end
