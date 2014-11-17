# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'printfection/version'

Gem::Specification.new do |spec|
  spec.name          = "printfection"
  spec.version       = Printfection::VERSION
  spec.authors       = ["Casey O'Hara"]
  spec.email         = ["casey.ohara@printfection.com"]
  spec.summary       = "Implementation of the Printfection API for Ruby"
  spec.description   = ""
  spec.homepage      = "https://github.com/printfection/printfection-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.7.2"

  spec.add_development_dependency "bundler", ">= 1.6.8"
  spec.add_development_dependency "rake", "10.3.2"
  spec.add_development_dependency "rspec", "3.1.0"
  spec.add_development_dependency "simplecov", "0.9.1"
end

