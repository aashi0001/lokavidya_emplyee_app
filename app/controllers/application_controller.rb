class ApplicationController < ActionController::Base
	  #protect_from_forgery with: :exception
	  protect_from_forgery with: :null_session

	  rescue_from CanCan::AccessDenied do |e|
	  	redirect_to :controller=>"home", :action=>"show", :notice => e.message
	  end
	  helper_method :current_user

	def current_user=(user)
	  @current_user = user
	end

	def generate_authentication_token!
    
      return Devise.friendly_token
    
  	end

	def logged_in?
	    @user_id = params[:user_id]
	    @token = params[:token]
	    session = Session.where("user_id =#{user_id} and token='#{token}'")
	    if session.size > 0
	       return true
	    else
	       return false 
	    end
  end


end
