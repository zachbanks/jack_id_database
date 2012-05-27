require 'spec_helper'

describe Location do
  it 'should have valid factory' do
    create(:location).should be_valid
  end
  
  describe 'validations' do
    it 'should have a building' do
      build(:location, building: nil).should_not be_valid
    end
    
    it 'should have a room' do
      build(:location, room: nil).should_not be_valid
    end
    
    it 'should have a unique room for each building' do
      building = create(:building, name: 'Bowman')
      room = '320-A'
      
      create(:location, building: building, room: room)
      build(:location, building: building, room: room).should_not be_valid
    end
  end
  
  describe 'associations' do
    it { should have_many(:jack_ids) }
    it { should belong_to(:building) }
  end
  
  it 'should be sorted by building and then by room' do
    bowman = create(:building, name: 'Bowman')
    merril = create(:building, name: 'Merril')
    loc3 = create(:location, building: merril, room: '304-X')
    loc2 = create(:location, building: merril, room: '304-A')
    loc1 = create(:location, building: bowman)
    
    Location.all.should == [loc1, loc2, loc3]
  end
  
  it 'should return a custom string representation of itself' do
    create(:location, building: create(:building, name: 'Bowman'), room: '302').to_s.should == 'Bowman - 302'
  end
end

# == Schema Information
#
# Table name: locations
#
#  id          :integer         not null, primary key
#  building_id :integer
#  room        :string(255)
#  notes       :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

