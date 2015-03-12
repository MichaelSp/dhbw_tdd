class SessionIntegrationTest < ActionDispatch::IntegrationTest

  test 'can login' do
    get login_path
    assert_nil session[:user]
    post_via_redirect login_path, {user: {name: 'admin', password: 'admin'}}
    assert_not_nil session[:user]
    assert_equal root_path,  request.original_fullpath
    assert_select '.ui.message', 'Login Successful'
  end

  test 'cant login' do
    post_via_redirect login_path, {user: {name: 'evil', password: 'none'}}
    assert_equal login_path, request.original_fullpath
    assert_select '.ui.message', 'Wrong Name or Password'
  end

end