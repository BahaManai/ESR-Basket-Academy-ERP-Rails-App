class AddMontantToAssurances < ActiveRecord::Migration[8.0]
  def change
    add_column :assurances, :montant, :float
  end
end
