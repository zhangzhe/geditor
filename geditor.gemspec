# -*- encoding: utf-8 -*-
require File.expand_path('../lib/geditor/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["zhangzhe"]
  gem.email         = ["gary.zzhang@gmail.com"]
  gem.description   = %q{Distill from gblog, including editor, textile like syntax and code syntax highlight'}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = ""
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "geditor"
  gem.require_paths = ["lib"]
  gem.version       = Geditor::VERSION
  
  gem.add_dependency "coderay"
  gem.add_dependency 'actionpack'
end