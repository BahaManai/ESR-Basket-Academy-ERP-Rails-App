class AddForeignKeyToPaiements < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :paiements, :joueurs
  end
end
