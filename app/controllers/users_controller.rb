class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save && User.authenticate(@user.email,@user.password)
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'Usuario cadastrado com sucesso.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:email, :password,profile_attributes:[:name])
    end
    
end
