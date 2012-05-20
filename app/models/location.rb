class Location < ActiveRecord::Base
  attr_accessible :building, :room, :jack_id, :notes
  
  belongs_to :building
  has_many :jack_ids
  
  validates :building, :room, :presence => true
  
  # If the building is the same, make sure that the room is unique.
  validates :room, :uniqueness => { :scope => :building_id }
  
  def to_s
    "#{building.name} - #{room}"
  end
end
