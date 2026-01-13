class UpdateMontantForExistingAssurances < ActiveRecord::Migration[7.1]
  def up
    Assurance.update_all(montant: 50)
  end

  def down
    Assurance.update_all(montant: nil)
  end
end
