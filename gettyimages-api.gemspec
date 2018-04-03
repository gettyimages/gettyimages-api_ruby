# coding: utf-8
lib = File.expand_path('lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/GettyImagesApi/version'

Gem::Specification.new do |spec|
  spec.name          = "gettyimages-api"
  spec.version       = GettyImagesApi::VERSION
  spec.authors       = ["Getty Images"]
  spec.email         = ["developersupport@gettyimages.com"]
  spec.summary       = "Getty Images API SDK"
  spec.description   = "Getty Images API SDK"
  spec.homepage      = "https://github.com/gettyimages/gettyimages-api_ruby"
  spec.license       = "MIT"
  gem_files          = `git ls-files -z`.split("\x0")
  gem_ignored_files  = `git ls-files -z unit_tests/`.split("\x0")
  spec.files         = gem_files - gem_ignored_files - ['.travis.yml']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  
end
