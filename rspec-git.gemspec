# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-git/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec-git"
  gem.version       = Rspec::Git::VERSION
  gem.authors       = ["Nucc"]
  gem.email         = ["nucler.pl@gmail.com"]
  gem.description   = %q{Creates a commit in git after each TDD step using the new spec case as a commit message.}
  gem.summary       = %q{Creates a git commit after each TDD round.}
  gem.homepage      = "http://github.com/Nucc/rspec-git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
