require "test_helper"

class RunningSuggestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get running_suggestions_new_url
    assert_response :success
  end
end
