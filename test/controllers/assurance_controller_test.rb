require "test_helper"

class AssuranceControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end
  test "should get index" do
    get assurance_index_url
    assert_response :success
  end
end
