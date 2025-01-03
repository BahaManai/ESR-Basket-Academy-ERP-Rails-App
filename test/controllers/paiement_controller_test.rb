require "test_helper"

class PaiementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paiement_index_url
    assert_response :success
  end
end
