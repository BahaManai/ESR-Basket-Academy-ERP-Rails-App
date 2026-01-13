class AddEntraineurToSalaires < ActiveRecord::Migration[7.1]
  def change
    add_reference :salaires, :entraineur, null: false, foreign_key: true
  end
end
