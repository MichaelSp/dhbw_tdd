require "test_helper"

class SessionControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
    assert_select 'form.ui.form input', 4
  end

  def test_create
    get :create
    assert_response :success
  end

  def test_destroy
    get :destroy
    assert_response :success
  end

end
