class Admin < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation
  validates :username, :password, :presence => { :on => :create }
  validates :username, :uniqueness => true # Delete if you add an email field.
end
