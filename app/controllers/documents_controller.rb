class DocumentsController < ApplicationController
  
  def index
    @documents = Document.all
  end
  
  def listar_disp_baixa
    @documents = Document.docs_disp_baixa
  end
  
  def show
    @document = Document.find(params[:id])
  end

  def new
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
    redirect_to disponiveis_baixa_url
    
    
    
        
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
