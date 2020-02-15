require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test "the navigation" do
    get root_url
    assert_select "nav > .nav-wrapper > ul" do
      assert_select "a", "Users"
      assert_select "a", "Login"
    end
  end
end
