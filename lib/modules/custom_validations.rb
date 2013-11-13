module CustomValidationClassMethods

  def validates_restrict_destroy(filha,mens)
    # criando nome do metodo
    method_name = "validates_if_has_#{filha}"
    # adicionando o método à class
    define_method method_name.to_sym do
      if self.send(filha.to_s).size > 0
        self.errors.add(filha,mens)
      end
      return self.errors.blank?
    end
    # adicionando o método ao before_destroy
    before_destroy method_name.to_sym
  end
  
end
