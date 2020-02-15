require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test 'can login and logout' do
    visit login_path
    fill_in 'Name', with: users(:admin).name
    fill_in 'Password', with: "admin"
    click_on 'Submit'
    assert_selector '.card-panel', text: 'Login Successful'
    click_on 'Logout'
    assert_selector '.card-panel', text: 'Please login'
  end

  test 'cant see users index without login' do
    visit root_path
    assert_selector '.card-panel', text: 'Please login'
  end
end
