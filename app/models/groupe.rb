class Groupe < ApplicationRecord
  has_many :joueurs, dependent: :nullify
  belongs_to :entraineur
end
