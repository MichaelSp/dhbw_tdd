require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post login_url
    assert_response :success
  end

  test "should get destroy" do
    post login_path, params: { user: { name: 'admin', password: 'admin' } }
    follow_redirect!
    assert_response :success
    delete login_url
    assert_response :redirect
    follow_redirect! # to /
    assert_response :redirect
    follow_redirect! # to /login
    assert_response :success
  end

  test "should get new" do
    get login_url
    assert_select '.row > .col.l4.offset-l4 > .card > .card-content > form' do
      assert_select "input[name='user[name]']"
      assert_select "input[name='user[password]']"
    end
  end

  test 'cant login' do
    post login_path, params: {user: {name: 'evil', password: 'none'}}
    assert_response :success
    assert_select '.card-panel', 'Wrong Name or Password'
  end

  test 'should redirect to login' do
    get root_url
    assert_redirected_to login_path
    follow_redirect!
    assert_response :success
    assert_equal 'Please login', flash[:notice]
  end
end
