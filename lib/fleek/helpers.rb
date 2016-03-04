module Fleek
  class Helpers < ActionView::Base
    def initialize(env)
      @env = env
    end

    def assets_environment
      @env
    end
  end
end
