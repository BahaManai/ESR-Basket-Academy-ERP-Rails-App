class AddParentToJoueurs < ActiveRecord::Migration[8.0]
  def change
    add_reference :joueurs, :parent, null: true, foreign_key: true
  end
end
