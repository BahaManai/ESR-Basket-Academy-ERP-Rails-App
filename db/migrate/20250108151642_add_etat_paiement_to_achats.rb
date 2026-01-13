class AddEtatPaiementToAchats < ActiveRecord::Migration[7.1]
  def change
    add_column :achats, :etat_paiement, :string, default: "Non crédit"
  end
end
