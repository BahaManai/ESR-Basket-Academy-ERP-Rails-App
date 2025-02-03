class AddForeignKeys < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :achats, :joueurs
    add_foreign_key :assurances, :joueurs
    add_foreign_key :assurances, :saisons
  end
end
