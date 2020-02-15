require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    visit users_url
    fill_in "Name", with: "admin"
    fill_in "Password", with: "admin"
    click_on "Submit"
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Listing users"
    assert_selector "body .container"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password digest", with: @user.password_digest
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password digest", with: @user.password_digest
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
