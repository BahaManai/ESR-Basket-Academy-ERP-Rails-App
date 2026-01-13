require "test_helper"

class DepensesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
    @depense = depenses(:one)
  end

  test "should get index" do
    get depenses_url
    assert_response :success
  end

  test "should get new" do
    get new_depense_url
    assert_response :success
  end

  test "should create depense" do
    assert_difference("Depense.count") do
      post depenses_url, params: { depense: { date_depense: @depense.date_depense, designation: @depense.designation, prix: @depense.prix } }
    end

    assert_redirected_to depenses_url
  end


  test "should get edit" do
    get edit_depense_url(@depense)
    assert_response :success
  end

  test "should update depense" do
    patch depense_url(@depense), params: { depense: { date_depense: @depense.date_depense, designation: @depense.designation, prix: @depense.prix } }
    assert_redirected_to depenses_url
  end

  test "should destroy depense" do
    assert_difference("Depense.count", -1) do
      delete depense_url(@depense)
    end

    assert_redirected_to depenses_url
  end
end
