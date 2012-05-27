require 'spec_helper'

describe Location do
  it 'has valid factory' do
    create(:location)
  end
  
  describe 'validations' do
    it 'has a building'
    it 'has a room'
    it 'has a unique room for each building'
  end
  
  describe 'associations' do
    it 'has many jack ids'
    it 'belongs to a building'
  end
  
  it 'is sorted by building and then by room'
  it 'returns a custom string representation of itself'
end