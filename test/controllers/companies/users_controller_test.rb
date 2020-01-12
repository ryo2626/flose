require 'test_helper'

class Companies::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companies_user = companies_users(:one)
  end

  test "should get index" do
    get companies_users_url
    assert_response :success
  end

  test "should get new" do
    get new_companies_user_url
    assert_response :success
  end

  test "should create companies_user" do
    assert_difference('Companies::User.count') do
      post companies_users_url, params: { companies_user: {  } }
    end

    assert_redirected_to companies_user_url(Companies::User.last)
  end

  test "should show companies_user" do
    get companies_user_url(@companies_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_companies_user_url(@companies_user)
    assert_response :success
  end

  test "should update companies_user" do
    patch companies_user_url(@companies_user), params: { companies_user: {  } }
    assert_redirected_to companies_user_url(@companies_user)
  end

  test "should destroy companies_user" do
    assert_difference('Companies::User.count', -1) do
      delete companies_user_url(@companies_user)
    end

    assert_redirected_to companies_users_url
  end
end
