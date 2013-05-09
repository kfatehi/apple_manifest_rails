require_dependency "apple_manifest_rails/application_controller"

module AppleManifestRails
  class ManifestController < ApplicationController
    # Enroll (Capture UDID)
    def enroll
      @ios_device = request.user_agent =~ /(Mobile\/.+Safari)/
    end

    def mobileconfig
      enroll = AppleManifestRails::Enroll::MobileConfig.new(request)
      enroll.write_mobileconfig
      send_file enroll.outfile_path, type: enroll.mime_type
    end

    def extract_udid
      parser = AppleManifestRails::Enroll::ResponseParser.new(request)
      udid = parser.get 'UDID'
      version = parser.get 'VERSION'
      product = parser.get 'PRODUCT'
      # TODO log this stuff
      redirect_to "#{request.url}/check_install?udid=#{udid}", status: 301
    end

    # Check install
    def check_install
      @udid = params[:udid]
      @checker = AppleManifestRails::Install::Checker.new
      set_itms_url if @checker.installable?(@udid)
    end

    # Install (Send IPA)
    def install
      set_itms_url
      render layout:false
    end

    def manifest
      install = AppleManifestRails::Install::IPA.new(request)
      install.write_manifest
      send_file install.manifest_path
    end

    def send_ipa
      send_file ipa_path
    end

    private
    def ipa_path
      AppleManifestRails.ipa_path
    end

    def set_itms_url
      @itms_url = AppleManifestRails::Install::IPA.new(request).itms_uri
    end
  end
end