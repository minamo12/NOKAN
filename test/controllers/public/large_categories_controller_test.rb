require "test_helper"

class Public::LargeCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_large_categories_index_url
    assert_response :success
  end
end
