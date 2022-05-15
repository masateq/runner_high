require "test_helper"

class TrainingSuggestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get training_suggestions_new_url
    assert_response :success
  end
end
