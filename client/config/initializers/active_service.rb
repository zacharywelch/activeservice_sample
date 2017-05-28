require 'faraday_middleware'

ActiveService::API.setup :url => "http://localhost:3000" do |c|
  # Request
  c.request :json
  # Response
  c.use ActiveService::Middleware::DefaultParseJSON
  # Adapter
  c.use Faraday::Adapter::NetHttp
end
