# coding: utf-8
lib = File.expand_path('lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/ConnectSDK/version'

Gem::Specification.new do |spec|
  spec.name          = "ConnectSDK"
  spec.version       = ConnectSDK::VERSION
  spec.authors       = ["Rod Santos, Lisa Guo"]
  spec.email         = ["rod.santos@gettyimages.com"]
  spec.summary       = "Connect SDK"
  spec.description   = "Connect SDK"
  spec.homepage      = "https://connect.gettyimages.com/swagger"
  spec.license       = "MIT"
  gem_files          = `git ls-files -z`.split("\x0")
  gem_ignored_files  = `git ls-files -z unit_tests/`.split("\x0")
  spec.files         = gem_files - gem_ignored_files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  
end
