class AddEntraineurToGroupes < ActiveRecord::Migration[7.1]
  def change
    add_reference :groupes, :entraineur, null: false, foreign_key: true
  end
end
