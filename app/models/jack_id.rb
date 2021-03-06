class JackId < ActiveRecord::Base
  attr_accessible :label, :connections, :location_id
  belongs_to :location
  
  # Validate presence of attributes.
  validates :label, :presence => true
  
  # @return [String] The string representation of a JackID instance in the format: JackID - Bow-02-03-091.
  def to_s
    "Jack ID - #{label}"
  end
end

# == Schema Information
#
# Table name: jack_ids
#
#  id          :integer         not null, primary key
#  location_id :integer
#  label       :string(255)
#  connections :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

