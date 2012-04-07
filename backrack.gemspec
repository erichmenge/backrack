# -*- encoding: utf-8 -*-
require File.expand_path('../lib/backrack/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Erich Menge"]
  gem.email         = ["erich.menge@me.com"]
  gem.description   = %q{Create Backbone.js powered mobile apps using CoffeeScript and sprockets.  Use Rack for testing and development}
  gem.summary       = %q{Create Backbone.js powered mobile apps using CoffeeScript and sprockets}
  gem.homepage      = "https://github.com/erichmenge/Backrack"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "backrack"
  gem.require_paths = ["lib"]
  gem.version       = Backrack::VERSION
  
  gem.add_dependency('rake', '>= 0.8.7')
  gem.add_dependency('thor', '~> 0.14.6')
  gem.add_dependency('bundler', '~> 1.1')
end
