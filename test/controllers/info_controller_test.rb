require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get info_top_url
    assert_response :success
  end

  test "should get new" do
    get info_new_url
    assert_response :success
  end

  test "should get create" do
    get info_create_url
    assert_response :success
  end

end
