class CreateAssurances < ActiveRecord::Migration[8.0]
  def change
    create_table :assurances do |t|
      t.belongs_to :joueur
      t.float :montant
      t.date :date_paiement

      t.timestamps
    end
  end
end
