require 'spec_helper'

describe Building do
  it 'should have a valid factory' do
    create(:building).should be_valid
  end
  
  describe 'validations' do
    it 'should be invalid without a name' do
      build(:building, name: nil).should_not be_valid
    end
  
    it 'shoulde be invalid without a short name' do
      build(:building, short_name: nil).should_not be_valid
    end
  
    it 'should have a short name of exactly 3 characters' do
      build(:building, short_name: 'bow').should be_valid
    end
  
    it 'should be invalid when short name is not 3 characters long' do
      build(:building, short_name: "a").should_not be_valid
      build(:building, short_name: "abc123").should_not be_valid
    end
  
    it 'should have a unique name' do
      create(:building, name: 'Bowman Hall')
      build(:building, name: 'Bowman Hall').should_not be_valid
    end
  
    it 'should have a unique short name' do
      create(:building, short_name: 'bow')
      build(:building, short_name: 'bow').should_not be_valid
    end
  end
  
  describe 'associations' do
    it { should have_many(:locations) }
  
    it 'should destroy all locations when deleted' do
      building = create(:building_with_locations)
      building.destroy
      building.locations.should be_empty
    end
  end
  
  it 'should format short name to all lowercase letters' do
    create(:building, short_name: 'BOW').short_name.should == 'bow'
  end
  
  it 'should sort buildings alphabetically by name' do
    create(:building, name: 'Merril')
    create(:building, name: 'Bowman')
    Building.all.collect { |b| b.name }.should == ['Bowman', 'Merril']
  end
  
  it 'should return a custom string representation of itself' do 
    create(:building, name: 'Bowman').to_s.should == 'Building - Bowman'
  end
end

# == Schema Information
#
# Table name: buildings
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  short_name :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

