class CreateCredits < ActiveRecord::Migration[7.1]
  def change
    create_table :credits do |t|
      t.belongs_to :joueur
      t.string :type
      t.float :montant
      t.string :statut
      t.date :date_credit
      t.text :note

      t.timestamps
    end
  end
end
