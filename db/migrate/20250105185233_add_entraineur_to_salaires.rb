class AddEntraineurToSalaires < ActiveRecord::Migration[8.0]
  def change
    add_reference :salaires, :entraineur, null: false, foreign_key: true
  end
end
