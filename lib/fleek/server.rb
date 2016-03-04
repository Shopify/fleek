require 'action_cable'
require 'fleek/server/configuration'
require 'fleek/helpers'

module Fleek
  class Server < ActionCable::Server::Base
    attr_reader :helpers

    def initialize(env)
      super()
      @env = env
      @helpers = Fleek::Helpers.new(env)
      @listener = Listen.to(*@env.paths, latency: 0.1, wait_for_delay: 0.1) do |modified, added, removed|
        rebuild
      end
      @listener.start
    end

    def self.config
      Fleek::Server::Configuration
    end

    def config
      self.class.config
    end

    def rebuild
      connections.map do |connection|
        connection.send_async(:check_assets)
      end
    end
  end
end
