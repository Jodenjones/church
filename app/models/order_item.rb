class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :service
  
  validates_presence_of :service_id, :valor
end