require "test_helper"

class CartRemainderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_remainder_index_url
    assert_response :success
  end
end
