require 'rails'
require 'fleek/server'
require 'fleek/style_injector'

module Fleek
  class Railtie < Rails::Engine
    config.after_initialize do |app|
      app.routes.prepend do
        mount Fleek::Server.new(app.assets) => Fleek::Server.config.mount_path, internal: true
      end

      ActiveSupport.on_load(:action_view) do
        include Fleek::StyleInjector
      end
    end
  end
end
