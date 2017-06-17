require 'typhoeus/adapters/faraday'

ActiveService::API.setup url: "http://localhost:3000" do |c|
  # Request
  c.request :url_encoded

  # Response
  c.use ActiveService::Middleware::DefaultParseJSON
  c.response :logger if Rails.env.development?

  # Adapter
  c.adapter :typhoeus
end
