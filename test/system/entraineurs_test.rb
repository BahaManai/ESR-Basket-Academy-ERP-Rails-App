require "application_system_test_case"

class EntraineursTest < ApplicationSystemTestCase
  setup do
    @entraineur = entraineurs(:one)
  end

  test "visiting the index" do
    visit entraineurs_url
    assert_selector "h2", text: "Entraîneurs"
  end

  test "should create entraineur" do
    visit entraineurs_url
    click_on "New entraineur"

    fill_in "Nom", with: @entraineur.nom
    fill_in "Prénom", with: @entraineur.prénom
    fill_in "Téléphone", with: @entraineur.téléphone
    click_on "Create Entraineur"

    assert_text "Entraineur was successfully created"
    click_on "Back"
  end

  test "should update Entraineur" do
    visit entraineur_url(@entraineur)
    click_on "Edit this entraineur", match: :first

    fill_in "Nom", with: @entraineur.nom
    fill_in "Prénom", with: @entraineur.prénom
    fill_in "Téléphone", with: @entraineur.téléphone
    click_on "Update Entraineur"

    assert_text "Entraineur was successfully updated"
    click_on "Back"
  end

  test "should destroy Entraineur" do
    visit entraineur_url(@entraineur)
    click_on "Destroy this entraineur", match: :first

    assert_text "Entraineur was successfully destroyed"
  end
end
