class CreateParents < ActiveRecord::Migration[7.1]
  def change
    create_table :parents do |t|
      t.string :nom
      t.string :prénom
      t.integer :téléphone

      t.timestamps
    end
  end
end
