class AddMontantToAssurances < ActiveRecord::Migration[7.1]
  def change
    add_column :assurances, :montant, :float
  end
end
