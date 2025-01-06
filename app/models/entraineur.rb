class Entraineur < ApplicationRecord
  has_many :salaires, dependent: :destroy
  validates :salaire, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
