class Admin < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation
  
  validates :username, :password, :presence => { :on => :create }
  validates :username, :uniqueness => true # Delete if you add an email field.
  
  before_create { generate_token(:auth_token) }
  
  # This method generates a unique token that is stored in a cookie for saving the user's authentication session. 
  # @param [Symbol] column Database column where authentication token will be saved.
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Admin.exists?(column => self[column])
  end
end

# == Schema Information
#
# Table name: admins
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  auth_token      :string(255)
#

