class AddGroupeToJoueurs < ActiveRecord::Migration[8.0]
  def change
    add_reference :joueurs, :groupe, null: true, foreign_key: true
  end
end
