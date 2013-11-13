class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  
  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end
  # GET /states/new
  def new
    @state = State.new
  end

    # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render action: 'show', status: :created, location: @state }
      else
        format.html { render action: 'new' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to @state, notice: 'State was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
      if @state.destroy
        flash[:notice] = "Estado excluido com sucesso" 
      else
        erros = ""
        @state.errors.full_messages.each { |msg| erros += msg }
        flash[:error] = erros           
      end
      redirect_to states_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:name, :sigla)
    end
    
end
