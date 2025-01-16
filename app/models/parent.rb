class Parent < ApplicationRecord
  has_many :joueurs, dependent: :destroy

  def somme_credits_enfants
    joueurs.to_a.sum(&:somme_des_credits)
  end

  validates :nom, presence: true
  validates :prénom, presence: true
  validates :téléphone, format: { with: /\A\d{8}\z/, message: "doit être un nombre formé de 8 chiffres" }, allow_blank: true
end
