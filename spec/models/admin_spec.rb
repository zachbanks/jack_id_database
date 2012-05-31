require 'spec_helper'

describe Admin do
  it 'should have a valid factory' do
    create(:admin).should be_valid
  end
  
  describe 'validations' do
    it 'should have a username' do
      build(:admin, username: nil).should_not be_valid
    end
    
    it 'should have a password' do
      build(:admin, password: nil).should_not be_valid
    end
    
    it 'should have a unique username' do
      create(:admin, username: 'admin')
      build(:admin, username: 'admin').should_not be_valid
    end
  end
  
  it 'should generate an authentication token' do
    admin = Admin.create!(username: 'admin', password: 'password')
    admin.auth_token.should_not be_nil
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

