class Mov < ActiveRecord::Base
  
  belongs_to :document
  belongs_to :caixa
  belongs_to :account
  
end
