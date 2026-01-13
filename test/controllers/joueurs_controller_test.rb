require "test_helper"

class JoueursControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
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

    assert_redirected_to edit_joueur_url(Joueur.last)
  end


  test "should get edit" do
    get edit_joueur_url(@joueur)
    assert_response :success
  end

  test "should update joueur" do
    patch joueur_url(@joueur), params: { joueur: { date_naissance: @joueur.date_naissance, nom: @joueur.nom, note: @joueur.note, prénom: @joueur.prénom, sexe: @joueur.sexe } }
    assert_redirected_to joueurs_url
  end

  test "should destroy joueur" do
    assert_difference("Joueur.count", -1) do
      delete joueur_url(@joueur)
    end

    assert_redirected_to joueurs_url
  end
end
