class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.all
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
    @fornecedor.build_parceiro
  end

  # POST /fornecedors
  # POST /fornecedors.json
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

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
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

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    if not @fornecedor.destroy
        flash[:error] = @fornecedor.parceiro.errors.first[1]
    end
    respond_to do |format|
      format.html { redirect_to fornecedors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:regime, :tipo, parceiro_attributes:[:name,:cpf])
    end
end
