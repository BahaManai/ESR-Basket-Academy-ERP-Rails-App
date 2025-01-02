class CreateParents < ActiveRecord::Migration[8.0]
  def change
    create_table :parents do |t|
      t.string :nom
      t.string :prénom
      t.integer :téléphone

      t.timestamps
    end
  end
end
