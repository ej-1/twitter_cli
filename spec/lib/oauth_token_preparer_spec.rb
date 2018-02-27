describe OauthTokenPreparer do

  context 'valid ticker and date' do
    it 'receives valid json response' do
      access_token = OauthTokenPreparer.
        prepare_access_token(oauth_token, oauth_token_secret)
      expect(access_token).to eq(String) # how to test specific content
    end
  end

  context 'invalid oauth_token' do
    it 'receives error message' do
      access_token = OauthTokenPreparer.
        prepare_access_token(oauth_token, oauth_token_secret)
      expect(access_token).to eq(String) # how to test specific content
    end
  end

  context 'invalid oauth_token_secret' do
    it 'receives error message' do
      access_token = OauthTokenPreparer.
        prepare_access_token(oauth_token, oauth_token_secret)
      expect(access_token).to eq(String) # how to test specific content
    end
  end
end
