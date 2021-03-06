class Admin < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  
  validates :email, :password, :name, :presence => { :on => :create }
  validates :email, :uniqueness => true, :email_format => true
  
  before_create { generate_token(:auth_token) }
  
  # This method generates a unique token that is stored in a cookie for saving the user's authentication session. 
  # @param [Symbol] column Database column where authentication token will be saved.
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Admin.exists?(column => self[column])
  end
  
  def to_s
    "#{name} - #{email}"
  end
end

# == Schema Information
#
# Table name: admins
#
#  id              :integer(4)      not null, primary key
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  auth_token      :string(255)
#  email           :string(255)
#  name            :string(255)
#

