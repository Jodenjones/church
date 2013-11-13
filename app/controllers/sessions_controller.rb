class SessionsController < ApplicationController
  layout 'sessions'
  
  def new
  end
  
  def create
    if user = User.authenticate(params[:email],params[:password])
      flash[:notice] = 'logged in'
      session[:user_id] = user.id
      redirect_to root_path 
    else
      flash[:error] = 'user name and password doesnot match'
      redirect_to root_path 
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You successfully logged out"
    redirect_to root_path
  end
  
end
