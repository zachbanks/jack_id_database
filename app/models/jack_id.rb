class JackId < ActiveRecord::Base
  belongs_to :location
  
  # Validate presence of attributes.
  validates :label, :presence => true
end
