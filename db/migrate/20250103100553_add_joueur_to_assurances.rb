class AddJoueurToAssurances < ActiveRecord::Migration[8.0]
  def change
    add_reference :assurances, :joueur, null: false, foreign_key: true
  end
end
