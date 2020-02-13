require 'sinatra'
require_relative 'controllers/links_controller'

set :bind, '0.0.0.0'
set :port, 3000

get '/' do
  "Hello!"
end