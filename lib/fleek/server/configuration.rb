require 'action_cable'
require 'fleek/connection'

module Fleek
  class Server < ActionCable::Server::Base
    class Configuration
      class << self
        def url
          nil
        end

        def mount_path
          '/.well-known/flee'
        end

        def logger
          if defined?(::Rails)
            ::Rails.logger
          else
            @_logger ||= Logger.new(STDERR)
          end
        end

        def disable_request_forgery_protection
          true
        end

        def connection_class
          Fleek::Connection
        end

        def pubsub_adapter
          ActionCable::SubscriptionAdapter::Inline
        end

        def worker_pool_size
          100
        end

        def log_tags
          []
        end
      end
    end
  end
end
