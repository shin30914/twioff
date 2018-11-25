module Custom_Twitter_Helper
  def login_twitter(user)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET_KEY']
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
    client
  end
end