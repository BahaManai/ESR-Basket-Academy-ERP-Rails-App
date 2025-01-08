class DropCreditsTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :credits
  end

  def down
    create_table :credits do |t|
      t.string :type_credit
      t.float :montant
      t.string :statut
      t.date :date_credit
      t.text :note
      t.references :joueur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
