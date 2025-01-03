require "test_helper"

class AchatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get achat_index_url
    assert_response :success
  end
end
