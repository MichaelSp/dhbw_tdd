class User < ActiveRecord::Base
  has_secure_password

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
