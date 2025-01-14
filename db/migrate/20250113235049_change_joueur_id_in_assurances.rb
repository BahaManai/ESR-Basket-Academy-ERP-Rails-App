class ChangeJoueurIdInAssurances < ActiveRecord::Migration[8.0]
  def change
    change_column_null :assurances, :joueur_id, true
  end
end
