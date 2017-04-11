# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
# get '/home', to: 'home#error'
get '/error', to: 'home#error', as: 'error'
get '/', to: 'home#index'
