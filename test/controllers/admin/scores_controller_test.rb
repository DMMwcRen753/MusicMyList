require "test_helper"

class Admin::ScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_scores_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_scores_show_url
    assert_response :success
  end
end
