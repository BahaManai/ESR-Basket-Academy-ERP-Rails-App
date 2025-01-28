class Entraineur < ApplicationRecord
  has_many :salaires, dependent: :nullify
  has_many :groupes, dependent: :nullify
  validates :nom, presence: true
  validates :prénom, presence: true
  validates :téléphone, format: { with: /\A\d{8}\z/, message: "doit être un nombre formé de 8 chiffres" }, allow_blank: true
  validates :salaire, numericality: { greater_than_or_equal_to: 0 }
end
