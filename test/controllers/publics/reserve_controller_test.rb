require 'test_helper'

class Public::ReserveControllerTest < ActionDispatch::IntegrationTest
  test "should get shop_index" do
    get public_reserve_shop_index_url
    assert_response :success
  end

  test "should get restaurant_index" do
    get public_reserve_restaurant_index_url
    assert_response :success
  end

  test "should get create" do
    get public_reserve_create_url
    assert_response :success
  end

end
