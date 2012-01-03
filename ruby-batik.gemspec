# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby-batik/version"

Gem::Specification.new do |s|
  s.name        = "ruby-batik"
  s.version     = Batik::VERSION
  s.authors     = ["Kelley Reynolds"]
  s.email       = ["kelley.reynolds@rubyscale.com"]
  s.homepage    = "https://github.com/kreynolds/ruby-batik"
  s.summary     = %q{Wrapper for SVG Transcoding using Apache Batik}
  s.description = %q{Wrapper for SVG Transcoding using Apache Batik}

  s.rubyforge_project = "ruby-batik"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.6.0"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
