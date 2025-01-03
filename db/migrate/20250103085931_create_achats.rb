class CreateAchats < ActiveRecord::Migration[8.0]
  def change
    create_table :achats do |t|
      t.belongs_to :joueur
      t.string :designation
      t.float :prix
      t.date :date_achat

      t.timestamps
    end
  end
end
