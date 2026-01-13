class CreateEntraineurs < ActiveRecord::Migration[7.1]
  def change
    create_table :entraineurs do |t|
      t.string :nom
      t.string :prénom
      t.integer :téléphone

      t.timestamps
    end
  end
end
