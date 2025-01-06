class Salaire < ApplicationRecord
  belongs_to :entraineur
  validates :salaire, :mois, :annee, :entraineur_id, presence: true
end
