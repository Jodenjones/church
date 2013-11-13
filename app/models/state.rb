class State < ActiveRecord::Base
  has_many :cities, :dependent => :restrict_with_error
  
end
  