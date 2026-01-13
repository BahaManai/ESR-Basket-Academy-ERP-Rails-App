class ChangeEntraineurIdToAllowNullInGroupes < ActiveRecord::Migration[7.1]
  def change
    change_column_null :groupes, :entraineur_id, true
  end
end
