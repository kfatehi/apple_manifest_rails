$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "apple_manifest_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "apple_manifest_rails"
  s.version     = AppleManifestRails::VERSION
  s.authors     = ["Keyvan Fatehi"]
  s.email       = ["keyvanfatehi@gmail.com"]
  s.homepage    = "https://github.com/keyvanfatehi/apple_manifest_rails"
  desc = "Mountable Rails engine for capturing iOS UDID, check if IPA is installable, and installing if so."
  s.summary     = desc
  s.description = desc

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency 'haml-rails', '~> 0.3.5'
  s.add_dependency 'rubyzip', '~> 0.9.9'
  # s.add_dependency "jquery-rails"
  # s.add_development_dependency "sqlite3"
end
