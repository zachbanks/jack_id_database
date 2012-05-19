class Building < ActiveRecord::Base
  before_save :format_attributes
  
  attr_accessible :name, :short_name, :locations
  
  has_many :locations
  
  # Validates presence of attributes.
  validates :name, :short_name, :presence => true
  
  # Short name can only be 3 characters long.
  validates :short_name, :length => { :is => 3 }
  
  # Makes sure you can't create copies of a building that has the same name or short name.
  validates :short_name, :uniqueness => true
  validates :name, :uniqueness => true
  
  private 
  
  # Format attributes before saving.
  def format_attributes
    self.name = name.titleize
    self.short_name = short_name.downcase
  end
  
end
