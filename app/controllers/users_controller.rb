class UsersController < ApplicationController
  before_filter :authenticate, :except => ['login', 'finalize_login']
  before_filter :is_owner, :only => 'show'
  
  def show
    @user = User.find(params[:id])
  end
  
  def login
    oauth.set_callback_url(TWITTER_RETURN_URL)
    
    session['rtoken'] = oauth.request_token.token
    session['rsecret'] = oauth.request_token.secret
    
    redirect_to oauth.request_token.authorize_url
  end
  
  def finalize_login
    oauth.authorize_from_request(session['rtoken'], session['rsecret'], params[:oauth_verifier])
    
    session['rtoken'] = nil
    session['rsecret'] = nil
    
    profile = Twitter::Base.new(oauth).verify_credentials
    user = User.find(profile.id)
    
    user.update_attributes({ :atoken => oauth.access_token.token, :asecret => oauth.access_token.secret })
    
    sign_in(user)
    
    flash[:notice] = "Welcome back @#{user.screen_name}"
    redirect_back_or(user_path(user))
  end
  
  def logout
    reset_session
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end
  
  def at_date
    @user = User.find(params[:id])
    @date = Date.strptime(params[:date], "%d%m%y")
    @workouts = @user.workouts.at_date(@date)
  end
  
  private
    def oauth
      @oauth ||= Twitter::OAuth.new(CONSUMER_KEY, CONSUMER_SECRET, :sign_in => true)
    end
end
