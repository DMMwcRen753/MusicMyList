require "test_helper"

class Public::ScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_scores_index_url
    assert_response :success
  end

  test "should get show" do
    get public_scores_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_scores_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_scores_new_url
    assert_response :success
  end
end
