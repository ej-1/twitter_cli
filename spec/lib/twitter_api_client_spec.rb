describe TwitterApiClient do

  before do
    @api_client = TwitterApiClient.new
  end

  context 'valid username' do
    it 'outputs tweets' do
      response = @api_client.get('realdonaldtrump', 5)
      expect(response.class).to eq(Array)
      expect(response.length).to be > 1
    end
  end

  context 'invalid username' do
    it 'receives error message' do
      response = @api_client.get('SOMEINVALIDUSERNAME', 5)
      expect(response).to eq("ERROR: No tweets found for this user name!")
    end
  end
end
