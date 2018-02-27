class ClientRunner

  def self.run_request(api_client, request_type, payload) # maybe change name of payload
    if payload || payload.is_a?(String)
      response = self.send_request(api_client, request_type, payload)
      puts response
    else
      puts 'you need to input twitter user name.'
    end
  end

  private

    def self.send_request(api_client, request_type, payload)
      begin
        api_client.send(request_type, payload)
      rescue
        # Retry request 3 times if request fails.
        3.times { api_client.send(request_type, payload) }
      end
    end
end
