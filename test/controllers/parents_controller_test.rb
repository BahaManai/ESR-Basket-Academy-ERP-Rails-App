require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
    @parent = parents(:one)
  end

  test "should get index" do
    get parents_url
    assert_response :success
  end

  test "should get new" do
    get new_parent_url
    assert_response :success
  end

  test "should create parent" do
    assert_difference("Parent.count") do
      post parents_url, params: { parent: { nom: @parent.nom, prénom: @parent.prénom, téléphone: @parent.téléphone } }
    end

    assert_redirected_to new_joueur_url
  end


  test "should get edit" do
    get edit_parent_url(@parent)
    assert_response :success
  end

  test "should update parent" do
    patch parent_url(@parent), params: { parent: { nom: @parent.nom, prénom: @parent.prénom, téléphone: @parent.téléphone } }
    assert_redirected_to parents_url
  end

  test "should destroy parent" do
    assert_difference("Parent.count", -1) do
      delete parent_url(@parent)
    end

    assert_redirected_to parents_url
  end
end
