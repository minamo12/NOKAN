require "test_helper"

class Admin::LargeCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_large_categories_index_url
    assert_response :success
  end
end
