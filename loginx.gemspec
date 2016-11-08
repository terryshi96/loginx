# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loginx/version'

Gem::Specification.new do |spec|
  spec.name          = "loginx"
  spec.version       = Loginx::VERSION
  spec.authors       = ["terryshi"]
  spec.email         = ["terryshi96@yahoo.com"]

  spec.summary       = %q{quick login}
  spec.description   = %q{quick login}
  spec.homepage      = "https://github.com/terryshi96/loginx"
  spec.license       = ""



  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "/usr/local/bin"
  spec.executables   = ["bin/loginx"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.12"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_dependency('methadone', '>= 1.9.3')

end
