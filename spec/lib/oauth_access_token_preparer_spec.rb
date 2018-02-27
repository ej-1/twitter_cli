describe OauthAccessTokenPreparer do

  context 'missing API_KEY' do
    it 'receives error message' do
      access_token = OauthAccessTokenPreparer.
        prepare_access_token(ENV['OAUTH_TOKEN'], 'oauth_token_secret')
      expect(access_token).to eq(String) # how to test specific content
    end
  end

  context 'missing API_KEY_SECRET' do
    it 'receives error message' do
      access_token = OauthAccessTokenPreparer.
        prepare_access_token(ENV['OAUTH_TOKEN'], ENV['OAUTH_TOKEN_SECRET'])
      expect(access_token).to eq(String) # how to test specific content
    end
  end
end
