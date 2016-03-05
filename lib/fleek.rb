module Fleek
  ENDPOINT = '/fleek-asset-update-connection'
end

require 'fleek/version'
require 'fleek/connection'
require 'fleek/server'

require 'fleek/railtie' if defined?(Rails)
