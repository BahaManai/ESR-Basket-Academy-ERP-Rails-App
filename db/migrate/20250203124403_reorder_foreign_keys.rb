class ReorderForeignKeys < ActiveRecord::Migration[7.1]
  def change
    if foreign_key_exists?(:achats, :joueurs)
      remove_foreign_key :achats, :joueurs
    end
    if foreign_key_exists?(:assurances, :joueurs)
      remove_foreign_key :assurances, :joueurs
    end
    if foreign_key_exists?(:assurances, :saisons)
      remove_foreign_key :assurances, :saisons
    end

    # Ajout des clés étrangères dans l'ordre souhaité
    add_foreign_key :achats, :joueurs
    add_foreign_key :assurances, :joueurs
    add_foreign_key :assurances, :saisons
  end
end
