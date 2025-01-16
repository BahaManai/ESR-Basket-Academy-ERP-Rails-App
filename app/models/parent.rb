class Parent < ApplicationRecord
  has_many :joueurs, dependent: :destroy
  def somme_credits_enfants
    joueurs.to_a.sum(&:somme_des_credits)
  end
  validates :nom, presence: true
  validates :prénom, presence: true
end
