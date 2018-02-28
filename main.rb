require './lib/client_runner.rb'
require './lib/twitter_api_client.rb'

OauthAccessTokenPreparer.assign_url('https://api.twitter.com')
TwitterApiClient.assign_token_preparer(OauthAccessTokenPreparer)
api_client = TwitterApiClient.new
client_runner = ClientRunner
request_type = 'get'
number_of_tweets = 5

loop do
  puts 'Enter a twitter user name? Example: realdonaldtrump'
  command_line_input = gets.chomp
  client_runner.run_request(api_client, request_type,
                            command_line_input,
                            number_of_tweets)
  break if command_line_input == 'exit'
end
