class AddNumRecuToAssurances < ActiveRecord::Migration[7.1]
  def change
    add_column :assurances, :num_recu, :integer, default: nil, null: true
  end
end
