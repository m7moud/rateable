# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rateable/version'

Gem::Specification.new do |spec|
  spec.name          = "rateable"
  spec.version       = Rateable::VERSION
  spec.authors       = ["Mahmoud Said"]
  spec.email         = ["m7moud.said@gmail.com"]
  spec.summary       = "Advanced Rating for Rails."
  spec.description   = "With Rateable, you can rate any Object you've in your App."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "activerecord"
  spec.add_dependency "activesupport"
end