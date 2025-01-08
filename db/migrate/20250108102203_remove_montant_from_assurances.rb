class RemoveMontantFromAssurances < ActiveRecord::Migration[8.0]
  def change
    remove_column :assurances, :montant, :float
  end
end
