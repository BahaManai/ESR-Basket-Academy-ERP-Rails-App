require "test_helper"

class AssuranceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assurance_index_url
    assert_response :success
  end
end
