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
  s.summary     = "Rails engine for iOS app distribution"
  s.description = "Mountable Rails engine for iOS UDID capture and app (IPA) distribution. Uses the IPA's embedded.mobileprovision to determine if IPA can be installed."
  s.licenses    = ['MIT', 'WTFPL']
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "WTFPL-LICENSE", "Rakefile", "README.md"]

  s.post_install_message = "Thanks for installing AppleManifestRails! See https://github.com/keyvanfatehi/apple_manifest_rails to see how to use this engine in your rails app to distribute your iOS applications."

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency 'haml-rails', '~> 0.3.5'
  s.add_dependency 'rubyzip', '~> 0.9.9'
end
