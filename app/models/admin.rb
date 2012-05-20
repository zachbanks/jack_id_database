class Admin < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation
  validates :username, :presence => true
  validates :username, :uniqueness => true # Delete if you add an email field.
end
