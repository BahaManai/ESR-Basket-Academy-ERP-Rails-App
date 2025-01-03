class AddJoueurToCredits < ActiveRecord::Migration[8.0]
  def change
    add_reference :credits, :joueur, null: false, foreign_key: true
  end
end
