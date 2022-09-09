require_relative './config/environment'

use Rack::Cors do
  allow do
    origins '*' #allow requests from all frontend origins(if you deploy your applications)
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

use Rack::JSONBodyParser

run ApplicationController