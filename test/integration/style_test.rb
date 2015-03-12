
class StyleTest < ActionDispatch::IntegrationTest

  test 'Application has a navbar' do
    get login_path
    assert_select '.ui.menu'
    assert_select 'a', 'Home'
  end

end