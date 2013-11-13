class CaixasController < ApplicationController
  before_action :set_caixa, only: [:show, :edit, :update, :destroy]

  # GET /caixas
  # GET /caixas.json
  def index
    @caixas = Caixa.all
  end

  # GET /caixas/1
  # GET /caixas/1.json
  def show
  end

  # GET /caixas/new
  def new
    @caixa = Caixa.new
  end

  # GET /caixas/1/edit
  def edit
  end

  # POST /caixas
  # POST /caixas.json
  def create
    @caixa = Caixa.new(caixa_params)

    respond_to do |format|
      if @caixa.save
        format.html { redirect_to @caixa, notice: 'Caixa was successfully created.' }
        format.json { render action: 'show', status: :created, location: @caixa }
      else
        format.html { render action: 'new' }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caixas/1
  # PATCH/PUT /caixas/1.json
  def update
    respond_to do |format|
      if @caixa.update(caixa_params)
        format.html { redirect_to @caixa, notice: 'Caixa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @caixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixas/1
  # DELETE /caixas/1.json
  def destroy
    @caixa.destroy
    respond_to do |format|
      format.html { redirect_to caixas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caixa
      @caixa = Caixa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caixa_params
      params.require(:caixa).permit(:name)
    end
end
