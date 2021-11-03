class UsersController < ApplicationController
	 def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:notice] = "Profile successfully updated"
       redirect_to authenticated_root_path
    else
       render 'edit'
    end
  end

  def change_password
     @user = User.find(current_user.id)
  end

  private
    def user_params
      params.require(:user).permit(:email, :name)
    end
end
