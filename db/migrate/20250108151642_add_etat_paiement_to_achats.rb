class AddEtatPaiementToAchats < ActiveRecord::Migration[8.0]
  def change
    add_column :achats, :etat_paiement, :string, default: "Non crédit"
  end
end
