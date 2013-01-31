# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dotfiles/version'

Gem::Specification.new do |gem|
  gem.name          = "dotfiles"
  gem.version       = Dotfiles::VERSION
  gem.authors       = ["C. Jason Harrelson (midas)"]
  gem.email         = ["jason@lookforwardenterprises.com"]
  gem.description   = %q{A unixish configuration that works for me.}
  gem.summary       = %q{The way I do.}
  gem.homepage      = "https://github.com/midas/dotfiles"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'growl'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-shell'
  gem.add_development_dependency 'ruby-debug19'

  gem.add_dependency 'rake'
end
