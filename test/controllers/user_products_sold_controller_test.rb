require 'test_helper'

class UserProductsSoldControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_products_sold_index_url
    assert_response :success
  end

end
