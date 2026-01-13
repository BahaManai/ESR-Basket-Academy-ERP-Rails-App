class ChangeHeureDebutEtHeureFinToTextInGroupes < ActiveRecord::Migration[7.1]
  def change
    change_column :groupes, :heure_debut, :string
    change_column :groupes, :heure_fin, :string
  end
end
