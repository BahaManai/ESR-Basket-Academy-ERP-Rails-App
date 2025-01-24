class ChangeHeureDebutEtHeureFinToTimeInGroupes < ActiveRecord::Migration[8.0]
  def change
    change_column :groupes, :heure_debut, :time
    change_column :groupes, :heure_fin, :time
  end
end
