class SessionsIntegrationTest < ActionDispatch::IntegrationTest

  def login
    post_via_redirect login_path, {user: {name: 'admin', password: 'admin'}}
  end

  test 'can login' do
    get login_path
    assert_nil session[:user]
    post_via_redirect login_path, {user: {name: 'admin', password: 'admin'}}
    assert_not_nil session[:user]
    assert_equal root_path, request.original_fullpath
    assert_select '.ui.message', 'Login Successful'
  end

  test 'cant login' do
    post_via_redirect login_path, {user: {name: 'evil', password: 'none'}}
    assert_equal login_path, request.original_fullpath
    assert_select '.ui.message', 'Wrong Name or Password'
  end

  test 'can login and logout' do
    visit login_path
    fill_in 'Name', with: users(:admin).name
    fill_in 'Password', with: users(:admin).password
    click_on 'Login'
    page.has_content? 'Login Successful'
    click_on 'Logout'
    page.has_content? 'Logged out'
  end

end