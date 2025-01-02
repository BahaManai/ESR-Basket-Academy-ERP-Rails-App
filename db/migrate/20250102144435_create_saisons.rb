class CreateSaisons < ActiveRecord::Migration[8.0]
  def change
    create_table :saisons do |t|
      t.date :date_debut
      t.date :date_fin

      t.timestamps
    end
  end
end
