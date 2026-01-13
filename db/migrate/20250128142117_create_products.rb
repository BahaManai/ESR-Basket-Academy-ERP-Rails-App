class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :nom
      t.float :prix

      t.timestamps
    end
  end
end
