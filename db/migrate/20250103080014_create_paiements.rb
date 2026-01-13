class CreatePaiements < ActiveRecord::Migration[7.1]
  def change
    create_table :paiements do |t|
      t.belongs_to :joueur
      t.float :montant
      t.date :date_abonnement
      t.date :date_encaissement
      t.string :etat_abonnement

      t.timestamps
    end
  end
end
