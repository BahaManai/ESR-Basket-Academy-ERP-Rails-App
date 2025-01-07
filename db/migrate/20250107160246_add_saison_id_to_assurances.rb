class AddSaisonIdToAssurances < ActiveRecord::Migration[8.0]
  def change
    add_reference :assurances, :saison, null: false, foreign_key: true
  end
end
