# AppleManifestRails

Mountable Rails engine for capturing iOS UDID, check if IPA is installable, and installing if so.

Created for a Rails 3.2 app, might work in Rails 4, but I haven't tried. Let me know if it works!

## Configuration

By default, the engine assumes the following directory structure in your rails project:

```
rails_application/
  app/
  config/
  ...
  mobile_build/              <------------- config.template_dir
    builds/
      app.ipa                <------------- config.ipa_path
    manifest.plist
    Profile.mobileconfig
```

The app.ipa file is the actual compiled binary archive from Xcode. The engine will look at the embedded.mobileprovision to check if the client is installable.

### Important Info

The plist and mobileconfig files are part of the UDID capture and install processes, they are templates that will be modified before being sent to the client. See the `templates` directory for what these files need to look like. Customize them to your liking and make sure they exist where expected.

The engine will not work without these.

### Custom Initializer

Optionally, you can override these defaults by setting up an initializer in your rails app, e.g. `config/initializers/apple_manifest_rails.rb`

```
AppleManifestRails.configure do |config|
  config.page_title = "Who needs testflight? I've got apple_manifest_rails!"
  config.template_dir = Rails.root.join('apple_manifest_rails', 'templates')
  config.ipa_path = Rails.root.join('apple_manifest_rails', 'binaries', 'my_custom.ipa')
end
```

## Install

Step 1: Add to your rails gemfile

```ruby
gem 'apple_manifest_rails'
```

Step 2: `bundle install`

Step 3: Mount the engine in `config/routes.rb`

```ruby
Example::Application.routes.draw do
  mount AppleManifestRails::Engine => '/'
end
```

Step 4: Start your `rails server` and navigate iOS Safari to `/enroll` or `/install` (aliased)

## Contributing

Yeah! Fork it, make it better! I know there are others out there that dislike relying on Testflight and Hockeyapp too -- that functionality can just be a mountable engine!

## License

MIT or WTFPL