class Workout < ActiveRecord::Base
  belongs_to :user
  scope :recent, lambda { |arg| where('created_at > ?', Time.now - arg[:hours].hours).order('created_at desc').limit(arg[:limit]) }
  scope :at_date, lambda { |date| where('created_at > ? AND created_at < ?', date.strftime("%Y-%m-%d"), (date + 1.day).strftime("%Y-%m-%d"))}
  
  def send_response
    if self.user.workouts.count == 1
      update_string = "@#{self.user.screen_name} Welcome to LogThisWorkout! Check out logthisworkout.com to view your workouts."
      Workout.client.update(update_string , { :in_reply_to_status_id => self.id })
    else
      update_string = "@#{self.user.screen_name} Your workout has been logged - #{self.created_at.strftime('%H:%M')}"
      Workout.client.update(update_string, { :in_reply_to_status_id => self.id })
    end
  end
  
  def self.fetch_and_update_db
    if Workout.last.present?
      workout_tweets = client.mentions({ :since_id => Workout.last.id })
    else
      workout_tweets = client.mentions
    end 
    
    workout_tweets.each do |tweet|
      new_workout = Workout.new_from_tweet(tweet) # Add the workout
      User.new_from_tweet(tweet) # Update or add a new user
      new_workout.send_response # Send response
    end
  end
  
  def self.new_from_tweet(workout_tweet)
    new_workout = Workout.new
    new_workout.id = workout_tweet.id
    new_workout.message = Workout.remove_user_from_message(workout_tweet.text)
    new_workout.source = workout_tweet.source
    new_workout.user_id = workout_tweet.user.id
    new_workout.created_at = workout_tweet.created_at
    new_workout.save
    return new_workout
  end
  
  def self.remove_user_from_message(message)
    message.gsub!(TWITTER_ACCOUNT + ' ', '')
  end
  
  def self.oauth
    @oauth ||= Twitter::OAuth.new(CONSUMER_KEY, CONSUMER_SECRET)
  end
  
  def self.client
    @client ||= begin
      self.oauth.authorize_from_access(ACCESS_TOKEN, ACCESS_SECRET)
      Twitter::Base.new(oauth)
    end
  end
end
