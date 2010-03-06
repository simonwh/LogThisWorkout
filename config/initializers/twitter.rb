TWITTER_ACCOUNT = '@logthisworkout'

CONSUMER_KEY = 'ag8lWNxndZoMEShRGwBzjA'
CONSUMER_SECRET = 'FAQ79RWl0yw3W5MAlal8lActJ4Xotm9RBzxRlopqhRo'
ACCESS_TOKEN = '117796053-0a3vI22RKgI9cBzljMNFdg3nicaBMBe1xhudV8Ij'
ACCESS_SECRET = 'QfbpROl4OmRLdN36GptvgFFFuuyOlKoP6W0VmDDcg'

if RAILS_ENV == 'development'
  TWITTER_RETURN_URL = 'http://localhost:3000/finalize_login'
else
  TWITTER_RETURN_URL = 'http://www.logthisworkout.com/finalize_login'
end
#oauth = oauth.authorize_from_access('117796053-zyQ3TRjIWfjNIAqCUP5djRIgsaLQf9CM0zDH3FQd', 'xXtrhaBf5yZC5kjDNrwD7ZGyCwDn4zm5n89lJgSJ4')