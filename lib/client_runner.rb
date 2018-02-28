class ClientRunner

  def self.run_request(api_client, request_type, payload, count) # maybe change name of payload
    if payload && payload.is_a?(String)
      response = send_request(api_client, request_type, payload, count)
      puts response
    else
      puts 'you need to input twitter user name.'
    end
  end

  private

  def self.send_request(api_client, request_type, payload, count)
    begin
      api_client.send(request_type, payload, count)
    rescue
      # Retry request 1 time if request fails.
      1.times { sleep 1, api_client.send(request_type, payload, count) }
    end
  end

  private_class_method :send_request
end
