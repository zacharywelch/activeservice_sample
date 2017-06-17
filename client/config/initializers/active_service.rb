require 'faraday_middleware'

ActiveService::API.setup url: "http://localhost:3000" do |c|
  # Request
  c.request :json

  # Response
  c.use ActiveService::Middleware::DefaultParseJSON
  c.response :logger if Rails.env.development?

  # Adapter
  c.adapter Faraday.default_adapter
end
