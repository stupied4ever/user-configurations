# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'user_configurations/version'

Gem::Specification.new do |spec|
  spec.name          = 'user-configurations'
  spec.version       = UserConfigurations::VERSION
  spec.authors       = ['Rafael da Silva Almeida']
  spec.email         = ['eusou@rafaelalmeida.net']
  spec.summary       = %q(Configurations for a project)
  spec.description   = %q(Configurations for a project, it will read from
  env vars, local or global files)
  spec.homepage      = 'http://github.com/stupied4ever/user-configurations'
  spec.license       = 'wtfpl'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 2.0'
end
