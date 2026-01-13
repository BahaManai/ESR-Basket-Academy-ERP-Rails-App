class ChangeHeureDebutEtHeureFinToTimeInGroupes < ActiveRecord::Migration[7.1]
  def change
    change_column :groupes, :heure_debut, :time
    change_column :groupes, :heure_fin, :time
  end
end
