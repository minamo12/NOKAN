require "test_helper"

class Admin::QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_quizzes_edit_url
    assert_response :success
  end
end
