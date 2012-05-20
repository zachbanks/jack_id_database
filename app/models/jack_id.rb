class JackId < ActiveRecord::Base
  belongs_to :location_id
  
  # Validate presence of attributes.
  validates :label, :presence => true
  
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

