require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test 'can login and logout' do
    visit login_path
    fill_in 'Name', with: users(:admin).name
    fill_in 'Password', with: "admin"
    click_on 'Submit'
    page.has_content? 'Login Successful'
    click_on 'Logout'
    page.has_content? 'Logged out'
  end

end
