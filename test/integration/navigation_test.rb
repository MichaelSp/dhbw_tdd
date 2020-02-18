require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test "the navigation" do
    get root_url
    follow_redirect!
    assert_select "nav > .nav-wrapper > ul" do
      assert_select "a", "Users"
      assert_select "a", "Login"
    end
  end

  test 'can login' do
    get login_path
    assert_nil session[:user]
    post login_path, params: {user: {name: 'admin', password: 'admin'}}
    assert_not_nil session[:user]
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select ".card-panel", 'Login Successful'
  end

  test "just cover the rest" do
    ApplicationCable::Channel
    ApplicationCable::Connection
    ApplicationJob
    ApplicationMailer
  end
end
