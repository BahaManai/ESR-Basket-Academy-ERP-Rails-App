class Product < ApplicationRecord
  validates :nom, presence: true, uniqueness: true
  validates :prix, numericality: { greater_than_or_equal_to: 0 }
end
