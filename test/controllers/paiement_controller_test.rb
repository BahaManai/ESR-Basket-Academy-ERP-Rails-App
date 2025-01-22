require "test_helper"

class PaiementControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end
  test "should get index" do
    get paiement_index_url
    assert_response :success
  end
end
