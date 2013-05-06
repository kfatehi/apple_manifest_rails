module AppleManifest
  module Install
    class IPA

      def template
        Rails.root.join('mobile_build', 'manifest.plist').to_s
      end

      def tmp
        Rails.root.join('tmp', 'manifest.plist').to_s
      end

      attr_accessor :base_url

      def initialize(request)
        self.base_url = "#{request.scheme}://#{request.host_with_port}"
      end

      def itms_uri
        "itms-services://?action=download-manifest&url=#{self.base_url}/apple_manifest/manifest.plist"
      end

      def url
        "#{self.base_url}/install/app.ipa"
      end

      def write_manifest
        File.open(tmp, "w") do |f|
          File.open(template, "r") do |tmpl|
            f.write tmpl.read.gsub("[IPAURL]", self.url)
          end
        end
      end

      def manifest_path
        Rails.root.join("tmp","manifest.plist").to_s
      end
    end
  end
end