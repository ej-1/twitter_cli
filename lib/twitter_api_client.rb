require 'oauth'
require 'pry'
require 'json'
require './lib/oauth_token_preparer.rb'

# WHAT IF I WANT TO ADD OPTIONS
# CHANGE THIS
# TwitterApiClient = Class.new(StandardError)

class TwitterApiClient
  include OauthTokenPreparer

  BASE_URI = 'https://api.twitter.com/1.1'

  @@token_preparer = OauthTokenPreparer

  def get(twitter_user_name)
    handle_timeouts do
      response = access_token.request(:get, url(twitter_user_name))
      handle_response(response)
    end 
  end

  def self.set_token_preparer(token_preparer)
    @@token_preparer = token_preparer
  end

  private

    def handle_response(response)
      if response.code == '200'
        JSON.parse(response.body).first['text']
      else
        JSON.parse(response.body)
      end
    end

    def access_token
      @@token_preparer.prepare_access_token(ENV['OAUTH_TOKEN'],
        ENV['OAUTH_TOKEN_SECRET'])
    end

    def url(twitter_user_name)
      "#{ BASE_URI }#{ path(twitter_user_name) }"
    end

    def api_key
      raise TwitterApiClient.new('missing API key') if ENV['TWITTER_API_KEY'].nil?
      ENV['TWITTER_API_KEY']
    end

    def path(twitter_user_name)
      "/statuses/user_timeline.json?screen_name=#{twitter_user_name}&count=1"
    end

    def handle_timeouts
      begin
        yield
      rescue Net::OpenTimeout, Net::ReadTimeout
        {error: {message: 'Timeout error'}}
      end
    end
end
