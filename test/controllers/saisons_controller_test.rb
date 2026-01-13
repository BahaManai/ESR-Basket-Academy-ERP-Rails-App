require "test_helper"

class SaisonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
    @saison = saisons(:one)
  end

  test "should get index" do
    get saisons_url
    assert_response :success
  end

  test "should get new" do
    get new_saison_url
    assert_response :success
  end

  test "should create saison" do
    assert_difference("Saison.count") do
      post saisons_url, params: { saison: { date_debut: @saison.date_debut, date_fin: @saison.date_fin, montant_abonnement: @saison.montant_abonnement, montant_assurance: @saison.montant_assurance } }
    end

    assert_redirected_to saisons_url
  end


  test "should get edit" do
    get edit_saison_url(@saison)
    assert_response :success
  end

  test "should update saison" do
    patch saison_url(@saison), params: { saison: { date_debut: @saison.date_debut, date_fin: @saison.date_fin } }
    assert_redirected_to saisons_url
  end

  test "should destroy saison" do
    assert_difference("Saison.count", -1) do
      delete saison_url(@saison)
    end

    assert_redirected_to saisons_url
  end
end
