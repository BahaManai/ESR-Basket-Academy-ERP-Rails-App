class AddSaisonIdToAssurances < ActiveRecord::Migration[7.1]
  def change
    add_reference :assurances, :saison, null: false, foreign_key: true
  end
end
