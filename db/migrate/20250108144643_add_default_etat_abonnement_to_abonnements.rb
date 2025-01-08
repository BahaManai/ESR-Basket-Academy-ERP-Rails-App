class AddDefaultEtatAbonnementToAbonnements < ActiveRecord::Migration[8.0]
  def change
    change_column_default :paiements, :etat_abonnement, 'Active'
  end
end
