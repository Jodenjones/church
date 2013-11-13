class Parceiro < ActiveRecord::Base
  has_one :member
  has_one :fornecedor
  has_many :documents, :dependent => :restrict_with_error
  validates_presence_of :name, :cpf
  validates_uniqueness_of :cpf
  
  
  
end
