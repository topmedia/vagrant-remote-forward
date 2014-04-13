# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-remote-forward/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-remote-forward"
  spec.version       = VagrantPlugins::RemoteForward::VERSION
  spec.authors       = ["Patrick Lenz"]
  spec.email         = ["plenz@topmedia.de"]
  spec.description   = "Add remote forward ports from the box to the host"
  spec.summary       = "Add remote forward ports from the box to the host"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
