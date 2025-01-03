require "test_helper"

class SalaireControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salaire_index_url
    assert_response :success
  end
end
