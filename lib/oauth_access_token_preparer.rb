require 'oauth'
require 'pry'
require 'json'
# Documentation
# https://developer.twitter.com/en/docs/basics/authentication/guides/single-user
module OauthAccessTokenPreparer

  def self.assign_url(url)
    @url = url
  end

  def self.prepare_access_token(oauth_token = nil, oauth_token_secret = nil)
    consumer = OAuth::Consumer
                .new(ENV['API_KEY'], ENV['API_SECRET'],
                  { site: @url,
                    scheme: :header })

    token_hash = { oauth_token: oauth_token,
                   oauth_token_secret: oauth_token_secret }
    # access_token
    OAuth::AccessToken.from_hash(consumer, token_hash)
  end

  def self.api_key
    raise 'missing API_KEY' if ENV['API_KEY'].nil?
    ENV['API_KEY']
  end

  def self.api_secret
    raise 'missing API_SECRET' if ENV['API_SECRET'].nil?
    ENV['API_SECRET']
  end
end
