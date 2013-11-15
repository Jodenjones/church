require './lib/modules/module_parceiro'
class Fornecedor < ActiveRecord::Base
  include ModuleParceiro
    
end
