class ChangeJoueurIdInAchats < ActiveRecord::Migration[7.1]
  def change
    change_column_null :achats, :joueur_id, true
  end
end
