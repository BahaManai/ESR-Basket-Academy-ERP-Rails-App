class CreateDepenses < ActiveRecord::Migration[8.0]
  def change
    create_table :depenses do |t|
      t.string :designation
      t.float :prix
      t.date :date_depense

      t.timestamps
    end
  end
end
