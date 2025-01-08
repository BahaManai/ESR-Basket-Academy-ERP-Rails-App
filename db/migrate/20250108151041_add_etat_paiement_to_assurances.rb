class AddEtatPaiementToAssurances < ActiveRecord::Migration[8.0]
  def change
    add_column :assurances, :etat_paiement, :string, default: "Non crédit"
  end
end
