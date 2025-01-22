class ChangeEntraineurIdToAllowNullInGroupes < ActiveRecord::Migration[8.0]
  def change
    change_column_null :groupes, :entraineur_id, true
  end
end
