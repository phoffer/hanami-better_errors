port ENV.fetch("PORT") { 2300 }

environment ENV.fetch("HANAMI_ENV") { "development" }

require_relative "../lib/hanami/puma/hot_reloader"
plugin :hanami_hot_reloader
