class AddSalaireToEntraineurs < ActiveRecord::Migration[7.1]
  def change
    add_column :entraineurs, :salaire, :float
  end
end
