require 'fleek/version'
require 'fleek/connection'
require 'fleek/server'

module Fleek
end

require 'fleek/railtie' if defined?(Rails)
