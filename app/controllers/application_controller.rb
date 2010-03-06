class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  before_filter :ensure_domain
  
  protect_from_forgery  
  helper :all
  
  DOMAIN = "logthisworkout.com"
  
  def is_owner
    if User.find_by_id(params[:id]) != current_user
      flash[:alert] = "This profile is not available."
      redirect_to root_path
    end
  end
  
  def ensure_domain
    if request.env['HTTP_HOST'] != DOMAIN && RAILS_ENV == 'production'
      redirect_to DOMAIN
    end
  end
end
