class DocumentsController < ApplicationController
  
  def index
    if params[:tipo] == 'R'
      @documents = Document.where :tipo => "R"
      @link_new = new_receber_url
    else
      @documents = Document.where :tipo => "A"
      @link_new = new_pagar_url
    end
  end
  
  def listar_disp_baixa
    @title = params[:tipo] == 'R' ?"Baixa de Contas a Receber" : "Baixa de Conta a Pagar"
    @documents = Document.docs_abertos params[:tipo]
    @tipo = params[:tipo]
  end
  
  def show
    @document = Document.find(params[:id])
  end

  def new
    @title = params[:tipo] == 'R' ?"Nova conta a Receber" : "Nova conta a Pagar"
    @tipo = params[:tipo]
    @document = Document.new
    @document.venc = Time.now
  end

  def create
    @document = Document.new(document_params)
    @document.sta = "A"
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document }
      else
        format.html { render action: 'new' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def baixar
    caixa_id = params[:caixa]
    if (caixa_id.size > 0) and (caixa = Caixa.find(caixa_id))
      params[:documents_ids].each do |d|
        doc = Document.find d
        doc.baixar caixa_id
      end
      flash[:notice] = "Baixa realizada com sucesso"      
    else
      flash[:error] = "informe o Caixa"
    end
    
    redirect_to params[:tipo] == 'R' ?disponiveis_baixa_receber_url : disponiveis_baixa_pagar_url
     
    #respond_to do |format|
    #  if @document.update(document_params)
    #    format.html { redirect_to @document, notice: 'Document was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: 'edit' }
    #    format.json { render json: @document.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end

  private
    
    def document_params
      params.require(:document).permit(:venc, :valor, :parceiro_id, :account_id)
    end
end
