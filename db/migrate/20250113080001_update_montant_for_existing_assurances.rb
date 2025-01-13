class UpdateMontantForExistingAssurances < ActiveRecord::Migration[8.0]
  def up
    Assurance.update_all(montant: 50)
  end

  def down
    Assurance.update_all(montant: nil)
  end
end
