require "test_helper"

class JoueursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @joueur = joueurs(:one)
  end

  test "should get index" do
    get joueurs_url
    assert_response :success
  end

  test "should get new" do
    get new_joueur_url
    assert_response :success
  end

  test "should create joueur" do
    assert_difference("Joueur.count") do
      post joueurs_url, params: { joueur: { date_naissance: @joueur.date_naissance, nom: @joueur.nom, note: @joueur.note, prénom: @joueur.prénom, sexe: @joueur.sexe } }
    end

    assert_redirected_to joueur_url(Joueur.last)
  end

  test "should show joueur" do
    get joueur_url(@joueur)
    assert_response :success
  end

  test "should get edit" do
    get edit_joueur_url(@joueur)
    assert_response :success
  end

  test "should update joueur" do
    patch joueur_url(@joueur), params: { joueur: { date_naissance: @joueur.date_naissance, nom: @joueur.nom, note: @joueur.note, prénom: @joueur.prénom, sexe: @joueur.sexe } }
    assert_redirected_to joueur_url(@joueur)
  end

  test "should destroy joueur" do
    assert_difference("Joueur.count", -1) do
      delete joueur_url(@joueur)
    end

    assert_redirected_to joueurs_url
  end
end
