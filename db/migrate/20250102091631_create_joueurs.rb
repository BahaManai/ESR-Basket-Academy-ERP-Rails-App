class CreateJoueurs < ActiveRecord::Migration[7.1]
  def change
    create_table :joueurs do |t|
      t.string :nom
      t.string :prénom
      t.string :sexe
      t.date :date_naissance
      t.text :note

      t.timestamps
    end
  end
end
