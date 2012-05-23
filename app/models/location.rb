class Location < ActiveRecord::Base
  attr_accessible :room, :jack_id, :notes, :building_id
  
  # Sort by building and then sort by room number.
  default_scope :order => 'building_id, room' # TODO: Fix this ordering!
  
  belongs_to :building
  has_many :jack_ids
  
  validates :building, :room, :presence => true
  
  # If the building is the same, make sure that the room is unique.
  validates :room, :uniqueness => { :scope => :building_id, :message => " already exists" }
  
  def to_s
    "#{building.name} - #{room}"
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

