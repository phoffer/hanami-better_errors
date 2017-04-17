# frozen_string_literal: true

require "puma/plugin"

module Hanami
  module Puma
    class HotReloader < ::Puma::Plugin
      def start(launcher)
        begin
          require "listen"
        rescue LoadError
          warn "listen gem not available"
          return
        end

        listener = Listen.to("apps", "lib") do |modified, added, removed|
          modified.each { |f| puts "M: #{f}" }
          added.each    { |f| puts "A: #{f}" }
          removed.each  { |f| puts "R: #{f}" }

          launcher.restart
        end

        listener.start
      end
    end
  end
end

Puma::Plugins.register("hanami_hot_reloader", Hanami::Puma::HotReloader)
