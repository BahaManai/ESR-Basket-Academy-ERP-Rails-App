class RemoveMontantFromAssurances < ActiveRecord::Migration[7.1]
  def change
    remove_column :assurances, :montant, :float
  end
end
