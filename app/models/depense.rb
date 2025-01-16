class Depense < ApplicationRecord
  validates :designation, presence: true
  validates :prix, numericality: { greater_than_or_equal_to: 0 }
  validates :date_depense, presence: true
end
