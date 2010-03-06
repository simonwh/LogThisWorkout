class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  before_filter :force_www
  
  protect_from_forgery  
  helper :all
  
  DOMAINWITHWWW = "www.logthisworkout.com"
  
  def is_owner
    if User.find_by_id(params[:id]) != current_user
      flash[:alert] = "This profile is not available."
      redirect_to root_path
    end
  end
  
  def force_www
    if request.env['HTTP_HOST'] != DOMAINWITHWWW && RAILS_ENV == 'production'
      redirect_to DOMAINWITHWWW
    end
  end
end
