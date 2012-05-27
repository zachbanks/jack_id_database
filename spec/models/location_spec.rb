require 'spec_helper'

describe Location do
  it 'should have valid factory' do
    create(:location)
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
    it 'should have many jack ids' do
      build(:location_with_jack_ids).jack_ids.each { |jack_id| jack_id.should_be_an_instance_of(JackId) }
    end
    
    it 'should belong to a building' do
      build(:location).should respond_to(:building)
    end
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