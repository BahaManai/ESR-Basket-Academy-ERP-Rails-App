require "application_system_test_case"

class DepensesTest < ApplicationSystemTestCase
  setup do
    @depense = depenses(:one)
  end

  test "visiting the index" do
    visit depenses_url
    assert_selector "h2", text: "Dépenses"
  end

  test "should create depense" do
    visit depenses_url
    click_on "Nouvelle dépense"

    fill_in "Date depense", with: @depense.date_depense
    fill_in "Designation", with: @depense.designation
    fill_in "Prix", with: @depense.prix
    click_on "Créer Dépense"

    assert_text "La dépense a été créée avec succès."
    click_on "Dépenses >"
  end

  test "should update Depense" do
    visit depense_url(@depense)
    click_on "Edit this depense", match: :first

    fill_in "Date depense", with: @depense.date_depense
    fill_in "Designation", with: @depense.designation
    fill_in "Prix", with: @depense.prix
    click_on "Update Depense"

    assert_text "Depense was successfully updated"
    click_on "Back"
  end

  test "should destroy Depense" do
    visit depense_url(@depense)
    click_on "Destroy this depense", match: :first

    assert_text "Depense was successfully destroyed"
  end
end
