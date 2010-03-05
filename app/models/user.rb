class User < ActiveRecord::Base
  has_many :workouts
  
  def self.new_from_tweet(workout_tweet)
    if existing_user = User.find_by_id(workout_tweet.user.id)
      existing_user.profile_image_url = workout_tweet.user.profile_image_url
      existing_user.save
    else
      new_user = User.new
      new_user.id = workout_tweet.user.id
      new_user.screen_name = workout_tweet.user.screen_name
      new_user.profile_image_url = workout_tweet.user.profile_image_url
      new_user.save
    end
  end  
  
  def authorized?
    self.atoken.present? && self.asecret.present?
  end
  
  def oauth
    @oauth ||= Twitter::OAuth.new(CONSUMER_KEY, CONSUMER_SECRET)
  end
  
  def client
    @client ||= begin
      oauth.authorize_from_access(self.atoken, self.asecret)
      Twitter::Base.new(oauth)
    end
  end
end