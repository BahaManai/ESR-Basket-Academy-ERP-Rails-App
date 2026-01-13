class RenametypeTotypeCreditInCredit < ActiveRecord::Migration[7.1]
  def change
    rename_column :credits, :type, :type_credit
  end
end
