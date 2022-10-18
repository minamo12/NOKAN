require "test_helper"

class Public::MockExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_mock_exams_index_url
    assert_response :success
  end

  test "should get show" do
    get public_mock_exams_show_url
    assert_response :success
  end
end
