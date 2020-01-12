require 'test_helper'

class Publics::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_user_show_url
    assert_response :success
  end

  test "should get update" do
    get publics_user_update_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_user_destroy_url
    assert_response :success
  end

  test "should get reserve_create" do
    get publics_user_reserve_create_url
    assert_response :success
  end

end
