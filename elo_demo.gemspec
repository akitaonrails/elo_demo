# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elo_demo/version'

Gem::Specification.new do |spec|
  spec.name          = "elo_demo"
  spec.version       = EloDemo::VERSION
  spec.authors       = ["Fabio Akita"]
  spec.email         = ["boss@akitaonrails.com"]

  spec.summary       = %q{This is a short demonstration of one of the most miunderstood topic in programming: ranking}
  spec.description   = %q{This short demo will show what most people think of ranking and what the beginnings of a good ranking system actually look like}
  spec.homepage      = "https://github.com/akitaonrails/elo_demo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "elo", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "faker", "~> 1.6.6"
end
