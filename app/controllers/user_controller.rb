class UserController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource
  def view
      if @current_user.role== "Admin"
      	@users = User.all
        elsif @current_user.role == "member"
          @users = User.where(role: "user").all
      end
      render 'view'
  end

  
  def role
  	@id = params[:id]
   @users = User.find(@id)
  end

  def update_role
  	@users = User.all
  	@uid = params[:user][:userid]
	 @users = User.find_by_id!(@uid)
			    if @users.update_attributes(user_params)
			      flash[:notice] = "User assigned role successfully."
			      redirect_to :action=>'view'
			    else
			      flash[:notice] = "Error while assinging user."
			      render 'role'
			    end 	    
  end
  def role_permissions
    @roles = Role.all
  end

  private

    def user_params
      params.require(:user).permit(:is_admin,:role)
    end
end
