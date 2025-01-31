class Saison < ApplicationRecord
  has_many :assurances, dependent: :destroy

  validates :date_debut, presence: true
  validates :date_fin, presence: true
  validates :montant_abonnement, numericality: { greater_than_or_equal_to: 0 }
  validates :montant_assurance, numericality: { greater_than_or_equal_to: 0 }
  validate :date_fin_apres_date_debut

  def self.actuelle
    find_by("date_debut <= ? AND date_fin >= ?", Date.today, Date.today)
  end

  private

  def date_fin_apres_date_debut
    if date_debut.present? && date_fin.present? && date_fin <= date_debut
      errors.add(:date_fin, "doit être après la date de début")
    end
  end
end
