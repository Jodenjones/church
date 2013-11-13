class City < ActiveRecord::Base
  belongs_to :state  
  validates_presence_of :state
  has_many :profiles, :dependent => :restrict_with_error
  
end
