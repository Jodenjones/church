class Service < ActiveRecord::Base
  has_many :order_items
  has_many :orders, :through => :order_item
end
