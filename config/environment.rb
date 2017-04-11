require 'bundler/setup'
require 'hanami/setup'

require_relative '../lib/struggling_errors'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
