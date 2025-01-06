class AddSalaireToEntraineurs < ActiveRecord::Migration[8.0]
  def change
    add_column :entraineurs, :salaire, :float
  end
end
