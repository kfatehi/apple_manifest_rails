require 'fileutils'
require 'zip/zipfilesystem'

module AppleManifest
  module Install
    class Checker
      attr_accessor :mobileprovision

      def initialize udid, appname
        ipa_path = Rails.root.join('mobile_build', 'builds', appname).to_s
        extract_mobileprovision_from ipa_path
        @installable = self.mobileprovision.include? udid
      end

      def installable? 
        @installable
      end
      
      private
      def extract_mobileprovision_from ipa_path
        tempfile = File.join('tmp', 'embedded.mobileprovision')
        FileUtils.rm tempfile if File.exists? tempfile
        Zip::ZipFile.open(ipa_path) do |zipfile|
          zipfile.each do |file|
            if file.to_s.include? 'embedded.mobileprovision'
              file.extract tempfile
              break
            end
          end
        end
        File.open(tempfile) {|f| self.mobileprovision = f.read }
        FileUtils.rm tempfile
      end
    end
  end
end
