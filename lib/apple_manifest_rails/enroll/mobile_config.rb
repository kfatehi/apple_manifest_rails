module AppleManifestRails
  module Enroll
    class MobileConfig
      attr_accessor :next_url

      def initialize request
        self.next_url = "#{request.url}/extract_udid"
      end

      def outfile_path
        Rails.root.join('tmp', 'Profile.mobileconfig').to_s
      end

      def mime_type
        "application/x-apple-aspen-config; charset=utf-8"
      end

      def write_mobileconfig
        File.open(self.outfile_path, "w") do |out|
          File.open(template_path, "r") do |tmpl|
            out.write tmpl.read.gsub('[NextURL]', self.next_url)
          end
        end
      end

      private
      def template_path
        AppleManifestRails.template('Profile.mobileconfig')
      end
    end
  end
end