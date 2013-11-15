class Document < ActiveRecord::Base
  belongs_to :parceiro
  belongs_to :account
  has_many :movs
  
  validates_presence_of :parceiro
  validates_presence_of :account
  validates_presence_of :valor
  
  def self.docs_abertos( p_tipo)
    Document.where :sta => 'A', :tipo => p_tipo
  end
  
  def self.docs_baixados( p_tipo)
    Document.where :sta => 'B', :tipo => p_tipo
  end
  
  def baixar(caixa_id)
    self.sta = "B"
    mov = Mov.new
    mov.dtlanc = Time.now
    mov.tipo = self.account.tipo
    mov.valor = self.valor
    mov.account = self.account
    mov.document = self
    mov.caixa = Caixa.find caixa_id
    self.movs << mov
    self.save
  end
  
end
