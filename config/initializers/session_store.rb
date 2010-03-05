# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_logthisworkout_session',
  :secret => 'b345b7acc23b9ba9e961c5d4de9493a40403cca9708a45ca15a6ba0f6b8820f2ba8aa4cf0ce42f9d7e98720a9a56c71f3e07568f4e1667ad8bdf5a353911d06c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
