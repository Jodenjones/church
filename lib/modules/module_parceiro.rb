module ModuleParceiro

  def ModuleParceiro.included( mod)
    mod.extend ModuleParceiro::ClassMethods
    mod.act_as_parceiro
  end
   
  module ClassMethods
    def act_as_parceiro
      belongs_to :parceiro
      accepts_nested_attributes_for :parceiro
      validates_presence_of :parceiro
      has_many :documents, :through => :parceiro, :dependent => :restrict_with_error
      before_validation :set_parceiro, :on => :create  
    end
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