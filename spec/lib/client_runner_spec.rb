describe ClientRunner do

  before do
    TwitterApiClient.set_token_preparer(OauthAccessTokenPreparer)
    @client_runner = ClientRunner
    @api_client = TwitterApiClient.new
  end

  context 'receives valid twitter username' do
    it 'prints latest tweet' do
      command_line_input = 'realdonaldtrump'
      expect { @client_runner.run_request(@api_client, 'get', command_line_input) }.
        to output.to_stdout
    end
  end

  context 'receives invalid twitter username' do
    it 'prints latest tweet' do
      command_line_input = 'SOMEINVALIDUSERNAME'
      expect { @client_runner.run_request(@api_client, 'get', command_line_input) }.
        to output("{\"errors\"=>[{\"code\"=>34, \"message\"=>\"Sorry, that page does not exist.\"}]}\n").
          to_stdout
    end
  end
end
