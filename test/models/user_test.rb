require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def user
    @user ||= User.new
  end

  def test_invalid
    assert !user.valid? # password is required!
  end

  test 'user can store a password' do
    user = User.new
    assert user.password_digest.blank?
    assert_respond_to user, :password=
    assert_respond_to user, :password
    user.password = '123'
    user.save!
    assert_not user.password_digest.blank?
  end

end
