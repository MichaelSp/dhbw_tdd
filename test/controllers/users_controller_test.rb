require "test_helper"

class UsersControllerTest < ActionController::TestCase

  setup {
    session[:user] = users(:admin).id
  }
  def user
    @user ||= users :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'index looks nice' do
    get :index
    assert_select 'table.ui.table'
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('User.count') do
      post :create, user: { email: user.email, name: user.name, password_digest: user.password_digest }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  def test_show
    get :show, id: user
    assert_response :success
  end

  def test_edit
    get :edit, id: user
    assert_response :success
  end

  def test_update
    put :update, id: user, user: { email: user.email, name: user.name, password_digest: user.password_digest }
    assert_redirected_to user_path(assigns(:user))
  end

  def test_destroy
    assert_difference('User.count', -1) do
      delete :destroy, id: user
    end

    assert_redirected_to users_path
  end
end
