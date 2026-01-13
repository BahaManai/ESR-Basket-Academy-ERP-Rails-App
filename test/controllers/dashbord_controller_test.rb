require "test_helper"

class DashbordControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end
  test "should get index" do
    get dashbord_index_url
    assert_response :success
  end
end
