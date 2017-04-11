require './config/environment'

if defined?(BetterErrors)# && Hanami.env?(:development)
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

run Hanami.app
