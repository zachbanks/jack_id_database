require 'spec_helper'

describe JackId do
  it 'should have a valid factory' do
    create(:jack_id).should be_valid
  end
  
  describe 'validations' do 
    it 'should have a jack id label' do
      build(:jack_id, label: nil).should_not be_valid
    end
  end
  
  describe 'associations' do
    it { should belong_to(:location) }
  end
  
  it 'should have a custom to_s' do
    create(:jack_id, label: 'bow-02-03-123').to_s.should == 'Jack ID - bow-02-03-123'
  end
end

# == Schema Information
#
# Table name: jack_ids
#
#  id          :integer         not null, primary key
#  location_id :integer
#  label       :string(255)
#  connections :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

