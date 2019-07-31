require 'test_helper'

class UserProductsInprocessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_products_inprocess_index_url
    assert_response :success
  end

end
