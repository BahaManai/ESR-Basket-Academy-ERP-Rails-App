class Salaire < ApplicationRecord
  belongs_to :entraineur

  validates :mois, :annee, presence: true
  validates :salaire, numericality: { greater_than_or_equal_to: 0 }
  validates :mois, uniqueness: { scope: [ :annee, :entraineur_id ], message: ": Un salaire pour ce mois et cette année existe déjà pour cet entraîneur" }
  validate :date_not_in_future

  private

  def date_not_in_future
    if annee.present? && mois.present?
      current_date = Date.current
      salaire_date = Date.new(annee, mois, 1) rescue nil

      if salaire_date > current_date
        errors.add(:base, "La date du salaire ne peut pas être dans le futur")
      end
    end
  end
end
