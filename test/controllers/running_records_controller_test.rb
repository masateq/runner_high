require "test_helper"

class RunningRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get running_records_new_url
    assert_response :success
  end

  test "should get index" do
    get running_records_index_url
    assert_response :success
  end

  test "should get edit" do
    get running_records_edit_url
    assert_response :success
  end
end
