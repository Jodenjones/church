require './lib/modules/module_parceiro'
class Member < ActiveRecord::Base
  include ModuleParceiro
  
end