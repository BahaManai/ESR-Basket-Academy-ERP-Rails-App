class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :nom
      t.float :prix

      t.timestamps
    end
  end
end
