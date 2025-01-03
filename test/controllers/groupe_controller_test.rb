require "test_helper"

class GroupeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get groupe_index_url
    assert_response :success
  end
end
