require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post login_url, params: {user: {name: "admin", password: "admin"}}
  end

  test "route to users" do
    get root_url
    assert_response :success
    assert_equal UsersController, controller.class
    assert_equal "index", controller.action_name
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test 'update with invalid data' do
    put user_url(@user), params: {user: {email: 'abcd'}}
    assert_select 'ul > li', 'Email is invalid'
  end

  test 'create an invalid user' do
    post users_url, params: {user: {email: 'abcd'}}
    assert_select 'ul > li', 'Email is invalid'
  end
end
