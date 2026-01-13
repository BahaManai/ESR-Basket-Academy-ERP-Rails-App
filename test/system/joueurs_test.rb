require "application_system_test_case"

class JoueursTest < ApplicationSystemTestCase
  setup do
    @joueur = joueurs(:one)
  end

  test "visiting the index" do
    visit joueurs_url
    assert_selector "h2", text: "Joueurs"
  end

  test "should create joueur" do
    visit joueurs_url
    click_on "New joueur"

    fill_in "Date naissance", with: @joueur.date_naissance
    fill_in "Nom", with: @joueur.nom
    fill_in "Note", with: @joueur.note
    fill_in "Prénom", with: @joueur.prénom
    fill_in "Sexe", with: @joueur.sexe
    click_on "Create Joueur"

    assert_text "Joueur was successfully created"
    click_on "Back"
  end

  test "should update Joueur" do
    visit joueur_url(@joueur)
    click_on "Edit this joueur", match: :first

    fill_in "Date naissance", with: @joueur.date_naissance
    fill_in "Nom", with: @joueur.nom
    fill_in "Note", with: @joueur.note
    fill_in "Prénom", with: @joueur.prénom
    fill_in "Sexe", with: @joueur.sexe
    click_on "Update Joueur"

    assert_text "Joueur was successfully updated"
    click_on "Back"
  end

  test "should destroy Joueur" do
    visit joueur_url(@joueur)
    click_on "Destroy this joueur", match: :first

    assert_text "Joueur was successfully destroyed"
  end
end
