class RenametypeTotypeCreditInCredit < ActiveRecord::Migration[8.0]
  def change
    rename_column :credits, :type, :type_credit
  end
end
