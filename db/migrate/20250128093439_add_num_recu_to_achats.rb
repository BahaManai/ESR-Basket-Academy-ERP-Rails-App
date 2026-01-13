class AddNumRecuToAchats < ActiveRecord::Migration[7.1]
  def change
    add_column :achats, :num_recu, :integer, default: nil, null: true
  end
end
