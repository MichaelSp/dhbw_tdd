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
    assert_response :success
  end

end
