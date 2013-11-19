class Caixa < ActiveRecord::Base
  validates_presence_of :name
  has_many :movs
end
