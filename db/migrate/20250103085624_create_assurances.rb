class CreateAssurances < ActiveRecord::Migration[7.1]
  def change
    create_table :assurances do |t|
      t.belongs_to :joueur
      t.float :montant
      t.date :date_paiement

      t.timestamps
    end
  end
end
