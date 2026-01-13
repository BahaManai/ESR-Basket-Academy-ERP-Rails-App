class CreateSalaires < ActiveRecord::Migration[7.1]
  def change
    create_table :salaires do |t|
      t.float :salaire
      t.integer :mois
      t.integer :annee

      t.timestamps
    end
  end
end
