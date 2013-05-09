require 'fileutils'
require 'zip/zipfilesystem'

module AppleManifestRails
  module Install
    class Checker
      attr_accessor :mobileprovision

      def initialize
        ipa_path = AppleManifestRails.ipa_path
        extract_mobileprovision_from ipa_path
      end

      def installable? udid
        self.mobileprovision.include? udid
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
