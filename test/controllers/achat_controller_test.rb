require "test_helper"

class AchatControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end
  test "should get index" do
    get achat_index_url
    assert_response :success
  end
end
