# AppleManifestRails

Mountable Rails engine for capturing iOS UDID, check if IPA is installable, and installing if so.

Created for a Rails 3.2 app, might work in Rails 4, but I haven't tried. Let me know if it works!

## Install

1. Add to your rails gemfile

```ruby
gem 'apple_manifest_rails'
```

2. Bundle

3. Mount the engine in `config/routes.rb`

```ruby
Example::Application.routes.draw do
  mount AppleManifestRails::Engine => '/'
end
```

4. Start your server and navigate your iOS Safari browser to `/enroll`

## Configure

The engine assumes the following directory structure in your rails project
```
rails_application/
  app/
  config/
  ...
  mobile_build/
    builds/
      app.ipa
    manifest.plist
    Profile.mobileconfig
```

The plist and mobileconfig files are part of the UDID capture and install processes, they are templates that will be modified before being sent to the client. See the `templates` directory for what these files need to look like. Customize them to your liking.

The app.ipa file is the actual compiled binary archive from Xcode. The engine will look at the embedded.mobileprovision to check if the client is installable.

## Contributing

Yeah! Fork it, make it better! I know there are others out there that dislike relying on Testflight and Hockeyapp too -- that functionality can just be a mountable engine!

## License
MIT