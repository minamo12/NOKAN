require "test_helper"

class Public::QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_quizzes_index_url
    assert_response :success
  end
end
