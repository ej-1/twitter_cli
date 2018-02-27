describe TwitterApiClient do

  before do
    @api_client = TwitterApiClient.new
  end

  context 'valid username' do
    it 'receives valid json response' do
      response = @api_client.get('realdonaldtrump')
      expect(response.class).to eq(String)
      expect(response.length).to be > 1
    end
  end

  context 'invalid username' do
    it 'receives error message' do
      response = @api_client.get('SOMEINVALIDUSERNAME')
      expect(response).to eq({"errors"=>[{"code"=>34,
        "message"=>"Sorry, that page does not exist."}]})
    end
  end
end
