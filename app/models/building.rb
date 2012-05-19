class Building < ActiveRecord::Base
  attr_accessible :name, :short_name, :locations
  
  has_many :locations
  
  validates :name, :short_name, :presence => true
  
  # Makes sure you can't create copies of a building that has the same name or short name.
  validates :short_name, :uniqueness => true
  validates :name, :uniqueness => true
end
