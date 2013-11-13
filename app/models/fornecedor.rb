class Fornecedor < ActiveRecord::Base
  belongs_to :parceiro, :dependent => :destroy
  accepts_nested_attributes_for :parceiro
  validates_presence_of :parceiro
  before_validation :set_parceiro, on: :create
  
  def errors
    erros = super
    self.parceiro.errors[:base].each do |e| 
      erros.add(:base,e) 
    end
    erros
  end
  
  def set_parceiro
    if self.new_record?
      par = Parceiro.find_by_cpf self.parceiro.cpf
      if par
        atributos = self.parceiro.attributes
        ["id","created_at","updated_at"].each do |a|
          atributos.delete a 
        end
        par.assign_attributes(atributos)
        self.parceiro = par
      end
    end
  end
    
end
