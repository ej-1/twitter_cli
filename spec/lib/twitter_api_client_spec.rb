describe TwitterApiClient do

  before do
    @api_client = TwitterApiClient.new
  end

  context 'valid ticker and date' do
    it 'receives valid json response' do
      response = @api_client.get('realdonaldtrump')
      expect(response.class).to eq(String)
      expect(response.length).to be > 1
    end
  end

  context 'invalid username' do
    it 'receives error message' do
      response = @api_client.get('SOMEINVALIDUSERNAME')
      expect(response).to eq({"errors"=>[{"code"=>34, "message"=>"Sorry, that page does not exist."}]})
    end
  end

  context 'invalid token' do
     # NEED TO WRITE TEST HERE,
    {"errors"=>[{"code"=>215, "message"=>"Bad Authentication data."}]}
  end
end
