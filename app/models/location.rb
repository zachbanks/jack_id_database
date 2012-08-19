class Location < ActiveRecord::Base
  attr_accessible :room, :jack_ids, :notes, :building_id, :jack_ids_attributes, :building, :last_modified_by
  
  before_save :update_last_modified_at
  
  # Sort by building and then sort by room number.
  # :readonly => false option prevents error when updating attributes that use scope.
  default_scope :joins => :building, :order => 'buildings.name, room', :readonly => false # TODO: Further refine. Needs to sort 123-2 before 123-12
  
  belongs_to :building
  has_many :jack_ids, :dependent => :destroy
  accepts_nested_attributes_for :jack_ids, :allow_destroy => true
  
  validates :building, :room, :presence => true
  
  # If the building is the same, make sure that the room is unique.
  validates :room, :uniqueness => { :scope => :building_id, :message => " already exists" }

  include PgSearch

  pg_search_scope :search, :against => [:room]
  
  # @return [String] Returns a string representation of a Location instance in the format: Bowman - 320-A.
  def to_s
    "#{building.name} - #{room}"
  end
  
  # Updates last_modified_at column with current date and time.
  def update_last_modified_at
    self.last_modified_at = DateTime.now
  end

  def last_modified_by=(values)
    self.name_of_last_to_modify = values.delete(:name) if values.has_key?(:name)
    self.email_of_last_to_modify = values.delete(:email) if values.has_key?(:email)
  end

  def last_modified_by
    {
      :name => self.name_of_last_to_modify,
      :email => self.email_of_last_to_modify
    }
  end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end

# == Schema Information
#
# Table name: locations
#
#  id               :integer(4)      not null, primary key
#  building_id      :integer(4)
#  room             :string(255)
#  notes            :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  last_modified_at :datetime
#

