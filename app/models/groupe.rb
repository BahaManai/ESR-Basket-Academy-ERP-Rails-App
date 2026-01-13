class Groupe < ApplicationRecord
  has_many :joueurs, dependent: :nullify
  belongs_to :entraineur
  validates :age_min, numericality: { greater_than_or_equal_to: 0 }
  validates :age_max, numericality: { greater_than_or_equal_to: 0 }
  validates :heure_debut, format: { with: /\A\d{2}:\d{2}\z/, message: "doit être au format HH:MM" }, allow_blank: true
  validates :heure_fin, format: { with: /\A\d{2}:\d{2}\z/, message: "doit être au format HH:MM" }, allow_blank: true
  validate :heure_debut_avant_fin
  validate :age_min_avant_age_max
  private

  def heure_debut_avant_fin
    if heure_debut.present? && heure_fin.present?
      debut = Time.strptime(heure_debut, "%H:%M")
      fin = Time.strptime(heure_fin, "%H:%M")
      if debut >= fin
        errors.add(:heure_debut, "doit être avant l'heure de fin")
      end
    end
  rescue ArgumentError
  end

  def age_min_avant_age_max
    if age_min.present? && age_max.present? && age_min >= age_max
      errors.add(:age_max, "doit être supérieur à l'âge minimal")
    end
  end
end
