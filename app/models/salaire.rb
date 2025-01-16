class Salaire < ApplicationRecord
  belongs_to :entraineur
  validates :salaire, :mois, :annee, presence: true
end
