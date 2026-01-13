class AddGroupeToJoueurs < ActiveRecord::Migration[7.1]
  def change
    add_reference :joueurs, :groupe, null: true, foreign_key: true
  end
end
