class Order < ActiveRecord::Base
  belongs_to :fornecedor
  has_many :order_items, :dependent => :destroy
  has_many :services, :through => :order_item
  
  validates_presence_of :fornecedor,:order_items, :total  
  accepts_nested_attributes_for :order_items, :allow_destroy => true
end
