class ChangeDefaultEtatAbonnementInPaiements < ActiveRecord::Migration[7.1]
  def change
    change_column_default :paiements, :etat_abonnement, 'Non crédit'
  end
end
