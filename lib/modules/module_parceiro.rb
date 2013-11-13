module ModuleParceiro

  def act_as_parceiro
    define_method :set_parceiro do 
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
    
    before_validation :set_parceiro, on: :create
  end
  
end
