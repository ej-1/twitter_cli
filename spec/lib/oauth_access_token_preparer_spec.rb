describe OauthAccessTokenPreparer do

  context 'API_KEY and API_SECRET are set' do
    it 'provides a acces_token with key and secret set' do
      access_token = OauthAccessTokenPreparer.
        prepare_access_token
      expect(access_token.class).to eq(OAuth::AccessToken)
      expect(access_token.consumer.key.class).to eq(String)
      expect(access_token.consumer.secret.class).to eq(String)
    end
  end
end
