module AppleManifestRails
  module Install
    class IPA

      def template
        AppleManifestRails.template('manifest.plist')
      end
      
      def manifest_path
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
        File.open(manifest_path, "w") do |f|
          File.open(template, "r") do |tmpl|
            f.write tmpl.read.gsub("[IPAURL]", self.url)
          end
        end
      end
    end
  end
end