class AddForeignKeyToJoueursGroupeId < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :joueurs, :groupes
  end
end
