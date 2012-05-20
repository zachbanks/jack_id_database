class JackId < ActiveRecord::Base
  belongs_to :location
  
  # Validate presence of attributes.
  validates :label, :presence => true
  
  def to_s
    "Jack ID - #{label}"
  end
  
end
