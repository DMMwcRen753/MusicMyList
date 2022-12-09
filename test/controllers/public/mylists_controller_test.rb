require "test_helper"

class Public::MylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_mylists_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_mylists_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_mylists_new_url
    assert_response :success
  end
end
