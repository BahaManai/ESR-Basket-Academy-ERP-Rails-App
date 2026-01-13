class AddParentToJoueurs < ActiveRecord::Migration[7.1]
  def change
    add_reference :joueurs, :parent, null: true, foreign_key: true
  end
end
