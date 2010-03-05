class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  
  protect_from_forgery  
  helper :all
  
  def is_owner
    if User.find_by_id(params[:id]) != current_user
      flash[:alert] = "This profile is not available."
      redirect_to root_path
    end
  end
end
