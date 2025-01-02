require "test_helper"

class EntraineursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entraineur = entraineurs(:one)
  end

  test "should get index" do
    get entraineurs_url
    assert_response :success
  end

  test "should get new" do
    get new_entraineur_url
    assert_response :success
  end

  test "should create entraineur" do
    assert_difference("Entraineur.count") do
      post entraineurs_url, params: { entraineur: { nom: @entraineur.nom, prénom: @entraineur.prénom, téléphone: @entraineur.téléphone } }
    end

    assert_redirected_to entraineur_url(Entraineur.last)
  end

  test "should show entraineur" do
    get entraineur_url(@entraineur)
    assert_response :success
  end

  test "should get edit" do
    get edit_entraineur_url(@entraineur)
    assert_response :success
  end

  test "should update entraineur" do
    patch entraineur_url(@entraineur), params: { entraineur: { nom: @entraineur.nom, prénom: @entraineur.prénom, téléphone: @entraineur.téléphone } }
    assert_redirected_to entraineur_url(@entraineur)
  end

  test "should destroy entraineur" do
    assert_difference("Entraineur.count", -1) do
      delete entraineur_url(@entraineur)
    end

    assert_redirected_to entraineurs_url
  end
end
