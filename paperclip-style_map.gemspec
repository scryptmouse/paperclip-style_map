# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "paperclip/style_map/version"

Gem::Specification.new do |spec|
  spec.name          = "paperclip-style_map"
  spec.version       = Paperclip::StyleMap::VERSION
  spec.authors       = ["Alexa Grey"]
  spec.email         = ["devel@mouse.vc"]

  spec.summary       = %q{Access Paperclip style URLs like a hash}
  spec.description   = %q{Access Paperclip style URLs like a hash}
  spec.homepage      = "https://github.com/scryptmouse/paperclip-style_map"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "paperclip", "> 4"
  spec.add_dependency "dux", '>= 0.8.0', '< 2'

  spec.add_development_dependency "appraisal", "~> 2.2.0"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "delayed_paperclip"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "sqlite3"
end
