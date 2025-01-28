class AddNumRecuToAchats < ActiveRecord::Migration[8.0]
  def change
    add_column :achats, :num_recu, :integer, default: nil, null: true
  end
end
