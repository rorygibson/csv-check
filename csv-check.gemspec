# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv-check/version'

Gem::Specification.new do |gem|
  gem.name          = "csv-check"
  gem.version       = CsvCheck::VERSION
  gem.authors       = ["rory"]
  gem.email         = ["rory@deadcrow.net"]
  gem.description   = %q{Lets you verify that cells in a CSV files match formats you expect}
  gem.summary       = %q{Allows you to specify formats (integer, float, string, date (with checking aginst date format strings) for columns in CSV data, both std in and files)}
  gem.homepage      = "http://github.com/rorygibson/csv-check"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "fastercsv", ">= 0"

  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "aruba"
end
