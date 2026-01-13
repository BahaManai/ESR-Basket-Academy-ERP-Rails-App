class AddNumRecuToPaiements < ActiveRecord::Migration[7.1]
  def change
    add_column :paiements, :num_recu, :integer, default: nil, null: true
  end
end
