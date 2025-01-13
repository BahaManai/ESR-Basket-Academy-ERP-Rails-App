class AddNumRecuToPaiements < ActiveRecord::Migration[8.0]
  def change
    add_column :paiements, :num_recu, :integer, default: nil, null: true
  end
end
