class AddJoueurToAchats < ActiveRecord::Migration[8.0]
  def change
    add_reference :achats, :joueur, null: false, foreign_key: true
  end
end
