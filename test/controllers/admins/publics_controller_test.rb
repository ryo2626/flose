require 'test_helper'

class Admins::PublicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_publics_index_url
    assert_response :success
  end

  test "should get update" do
    get admins_publics_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_publics_destroy_url
    assert_response :success
  end

end
