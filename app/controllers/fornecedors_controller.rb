class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  def index
    @fornecedors = Fornecedor.all
  end

  def new
    @fornecedor = Fornecedor.new
    @fornecedor.build_parceiro
  end

  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fornecedor }
      else
        format.html { render action: 'new' }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if not @fornecedor.destroy
      @fornecedor.errors.full_messages.each { |m| (flash[:error] ||= " ") << m }
    end
    respond_to do |format|
      format.html { redirect_to fornecedors_url }
      format.json { head :no_content }
    end
  end

  private
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end
    
    def fornecedor_params
      params.require(:fornecedor).permit(:regime, :tipo, parceiro_attributes:[:id,:name,:cpf])
    end
end
