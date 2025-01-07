class AddMontantsToSaisons < ActiveRecord::Migration[8.0]
  def change
    add_column :saisons, :montant_abonnement, :float
    add_column :saisons, :montant_assurance, :float
  end
end
