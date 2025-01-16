class Saison < ApplicationRecord
  has_many :assurances, dependent: :destroy
  def self.actuelle
    find_by("date_debut <= ? AND date_fin >= ?", Date.today, Date.today)
  end
  validates :date_debut, presence: true
  validates :date_fin, presence: true
end
