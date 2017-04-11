require 'sinatra'
require 'better_errors'

# my_app.rb
require 'sinatra/base'

class MyApp < Sinatra::Base
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
  
  get '/' do
    hello = 0
    @instance = []
    raise 'error'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
