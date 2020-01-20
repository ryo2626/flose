require 'test_helper'

class Companies::CommodityControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get companies_commodity_new_url
    assert_response :success
  end

  test "should get create" do
    get companies_commodity_create_url
    assert_response :success
  end

  test "should get show" do
    get companies_commodity_show_url
    assert_response :success
  end

end
