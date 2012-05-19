class Location < ActiveRecord::Base
  attr_accessible :building, :room, :jack_id, :notes
  
  belongs_to :building
  has_many :jack_ids
  
  validates :building, :room, :presence => true
  validates :room, :uniqueness => { :scope => :building_id }
end
