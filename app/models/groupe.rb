class Groupe < ApplicationRecord
  has_many :joueurs, dependent: :nullify
  belongs_to :entraineur
  validates :heure_debut, presence: true
  validates :heure_fin, presence: true
  validate :heure_debut_avant_fin

  private

  def heure_debut_avant_fin
    if heure_debut.present? && heure_fin.present? && heure_debut >= heure_fin
      errors.add(:heure_debut, "doit être avant l'heure de fin")
    end
  end
end
