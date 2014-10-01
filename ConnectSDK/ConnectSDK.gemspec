# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ConnectSDK/version'

Gem::Specification.new do |spec|
  spec.name          = "ConnectSDK"
  spec.version       = ConnectSDK::VERSION
  spec.authors       = ["Rod Santos, Lisa Guo"]
  spec.email         = ["rod.santos@gettyimages.com"]
  spec.summary       = "Connect SDK"
  spec.description   = "Connect SDK"
  spec.homepage      = "https://connect.gettyimages.com/swagger"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
