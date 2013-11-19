class Account < ActiveRecord::Base
  has_many :documents
  has_many :movs
  validates_presence_of :tipo, :name
  
end
