require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post login_url
    assert_response :success
  end

  test "should get destroy" do
    delete login_url
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


end
