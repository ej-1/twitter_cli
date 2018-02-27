require './lib/client_runner.rb'
require './lib/twitter_api_client.rb'

OauthAccessTokenPreparer.set_url('https://api.twitter.com')
TwitterApiClient.set_token_preparer(OauthAccessTokenPreparer)
api_client = TwitterApiClient.new
client_runner = ClientRunner
request_type = 'get'

loop do
  puts "Enter a twitter user name? Example: realdonaldtrump"
  command_line_input = gets.chomp
  client_runner.run_request(api_client, request_type, command_line_input)
  break if command_line_input == 'exit'
end
