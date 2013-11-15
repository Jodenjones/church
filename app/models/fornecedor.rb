require './lib/modules/module_parceiro'
class Fornecedor < ActiveRecord::Base
  include ModuleParceiro
  has_many :orders
  
  def name
    parceiro.name
  end
    
end
