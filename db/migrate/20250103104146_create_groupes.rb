class CreateGroupes < ActiveRecord::Migration[8.0]
  def change
    create_table :groupes do |t|
      t.integer :heure_debut
      t.integer :heure_fin
      t.string :jour
      t.string :terrain
      t.string :string
      t.integer :age_min
      t.integer :age_max

      t.timestamps
    end
  end
end
