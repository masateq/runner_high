require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_sessions_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_sessions_edit_url
    assert_response :success
  end
end
