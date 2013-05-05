AppleManifestRails::Engine.routes.draw do
  get "/enroll" => "manifest#enroll"
  get "/enroll/mobileconfig" => "manifest#mobileconfig"
  post "/enroll/mobileconfig/extract_udid" => "manifest#extract_udid"
  get "/enroll/mobileconfig/extract_udid/check_install" => "manifest#check_install"
  get "/install" => "manifest#install"
  get "/apple_manifest/manifest.plist" => "manifest#manifest"
  get "/install/(:appname).ipa" => "manifest#send_ipa"
end
