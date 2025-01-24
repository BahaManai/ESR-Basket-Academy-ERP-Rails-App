class ChangeHeureDebutEtHeureFinToTextInGroupes < ActiveRecord::Migration[8.0]
  def change
    change_column :groupes, :heure_debut, :string
    change_column :groupes, :heure_fin, :string
  end
end
