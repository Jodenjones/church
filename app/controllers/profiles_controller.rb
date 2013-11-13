class ProfilesController < ApplicationController
  
  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Profile updated."
      redirect_to root_path
    else
      render 'edit'
    end  
  end
  
  private
  
    def profile_params
      params.require(:profile).permit(:name, :birthday, :city_id)
    end
end
