class AddMontantsToSaisons < ActiveRecord::Migration[7.1]
  def change
    add_column :saisons, :montant_abonnement, :float
    add_column :saisons, :montant_assurance, :float
  end
end
