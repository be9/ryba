# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ryba/version"

Gem::Specification.new do |s|
  s.name        = "ryba"
  s.version     = Ryba::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["oleg dashevskii"]
  s.email       = %q{olegdashevskii@gmail.com}
  s.homepage    = "http://github.com/be9/ryba"
  s.summary     = %q{Russian faker}
  s.description = %q{Russian names and addresses generator}

  s.rubyforge_project = "ryba"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.extra_rdoc_files = [ "README.textile" ]

  s.add_development_dependency "rspec"
end
