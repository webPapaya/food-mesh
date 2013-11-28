$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fddb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fddb"
  s.version     = Fddb::VERSION
  s.authors     = ["Thomas Mayrhofer"]
  s.email       = ["thomas@mayrhofer.at"]
  s.homepage    = "thomas.mayrhofer.at"
  s.summary     = "GEM which fetches data from the fddb.info website"
  s.description = "lalelu"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"

  s.add_development_dependency "sqlite3"
end
