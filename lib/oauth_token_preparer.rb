require 'oauth'
require 'pry'
require 'json'
# Documentation
# https://developer.twitter.com/en/docs/basics/authentication/guides/single-user
module OauthTokenPreparer

  def self.prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.
      new(ENV['API_KEY'], ENV['API_SECRET'],
        { :site => "https://api.twitter.com",
          :scheme => :header })

    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token,
                   :oauth_token_secret => oauth_token_secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
  end
end
