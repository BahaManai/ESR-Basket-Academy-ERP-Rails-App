class Groupe < ApplicationRecord
  has_many :joueurs, dependent: :destroy
end
