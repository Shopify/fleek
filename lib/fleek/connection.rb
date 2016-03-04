require 'action_cable'
require 'concurrent'

module Fleek
  class Connection < ActionCable::Connection::Base
    attr_reader :assets

    delegate :helpers, to: :server

    def initialize(*args)
      super
      @assets = Concurrent::Array.new
    end

    def receive(message)
      data = ActiveSupport::JSON.decode(message)
      if data['identifier'] == 'register_assets'
        assets.push(*data['assets'])
      end
    end

    def check_assets
      assets.each do |asset|
        transmit({
          identifier: 'asset_updated',
          asset: asset,
          new_url: helpers.path_to_stylesheet(asset, debug: false)
        }.to_json)
      end
    end
  end
end
