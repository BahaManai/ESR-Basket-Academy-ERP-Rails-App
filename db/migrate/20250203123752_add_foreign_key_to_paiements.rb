class AddForeignKeyToPaiements < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :paiements, :joueurs
  end
end
