require 'oauth'
require 'json'

module OauthAccessTokenPreparer

  def self.assign_url(url)
    @url = url
  end

  def self.prepare_access_token(oauth_token = nil, oauth_token_secret = nil)
    consumer = OAuth::Consumer
                .new(api_key, api_secret,
                  { site: @url,
                    scheme: :header })

    token_hash = { oauth_token: oauth_token,
                   oauth_token_secret: oauth_token_secret }

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

  private_class_method :api_key, :api_secret
end
