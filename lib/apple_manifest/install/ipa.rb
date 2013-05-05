module AppleManifest
  module Install
    class IPA
      MANIFEST = {
        template: Rails.root.join('mobile_build', 'manifest.plist').to_s,
        tmp: Rails.root.join('tmp', 'manifest.plist').to_s
      }

      attr_accessor :base_url

      def initialize(request)
        self.base_url = "#{request.scheme}://#{request.host_with_port}"
      end

      def itms_uri
        "itms-services://?action=download-manifest&url=#{self.base_url}/apple_manifest/manifest.plist"
      end

      def url
        "#{self.base_url}/install/critique.ipa"
      end

      def write_manifest
        File.open(MANIFEST[:tmp], "w") do |f|
          File.open(MANIFEST[:template], "r") do |tmpl|
            f.write tmpl.read.gsub("[IPAURL]", self.url)
          end
        end
      end

      def manifest_path
        File.join(Rails.root.join("tmp","manifest.plist"))
      end
    end
  end
end