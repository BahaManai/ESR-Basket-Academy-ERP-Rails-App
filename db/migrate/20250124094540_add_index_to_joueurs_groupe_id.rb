class AddIndexToJoueursGroupeId < ActiveRecord::Migration[8.0]
  def change
    add_index :joueurs, :groupe_id
  end
end
