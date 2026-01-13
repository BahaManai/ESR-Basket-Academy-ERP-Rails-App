class Salaire < ApplicationRecord
  belongs_to :entraineur

  validates :mois, :annee, presence: true
  validates :salaire, numericality: { greater_than_or_equal_to: 0 }
  validate :date_not_in_future
  validate :total_salaire_not_exceed_entraineur_salaire

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

  def total_salaire_not_exceed_entraineur_salaire
    if entraineur.present? && mois.present? && annee.present?
      total_salaire = entraineur.salaires.where(mois: mois, annee: annee).sum(:salaire)
      if total_salaire + salaire > entraineur.salaire
        errors.add(:base, "La somme des montants ajoutés pour ce mois ne doit pas dépasser le salaire mensuel de l'entraîneur. Le montant ajouté pour ce mois est #{total_salaire}/#{entraineur.salaire} DT")
      end
    end
  end
end
