# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fleek/version'

Gem::Specification.new do |spec|
  spec.name          = "fleek"
  spec.version       = Fleek::VERSION
  spec.authors       = ["Bouke van der Bijl"]
  spec.email         = ["bouke@shopify.com"]

  spec.summary       = %q{Fleek keeps your styles hot}
  spec.description   = %q{Fleek automatically injects any updates stylesheets when you change and save a file. This allows for faster iteration when working in CSS or any variant of it.}
  spec.homepage      = "https://github.com/Shopify/fleek"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'actioncable', '>= 5.0.0.beta3', '< 5.1'
  spec.add_dependency 'actionview', '>= 5.0.0.beta3', '< 5.1'
  spec.add_dependency 'listen', '~> 3.0.5'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
