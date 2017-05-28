ActiveService::API.setup :url => "http://localhost:3000" do |c|
  # Request
  c.use Faraday::Request::UrlEncoded
  # Response
  c.use ActiveService::Middleware::DefaultParseJSON
  # Adapter
  c.use Faraday::Adapter::NetHttp
end
