class HomeController < ApplicationController
  def index
  	if user_signed_in?

  		redirect_to :controller =>"user", :action=>"view"
    else
      render :action=>"show"
  	end
  end
  def show
  end

def view
    @videos = Video.all
  end


  def okay
  	
  end

  def new
  end
end
