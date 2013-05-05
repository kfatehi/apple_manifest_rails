module AppleManifest
  module Install
    class Checker
      CHECK_INSTALL = Rails.root.join('mobile_build', 'check_install.sh').to_s

      def initialize udid, appname
        ipa_path = Rails.root.join('mobile_build', 'builds', appname).to_s
        `#{CHECK_INSTALL} #{ipa_path} | grep #{udid.strip}` # FIXME DONT DO THIS!!!! LOL
        @installable = ($? == 0)
      end

      def installable?
        @installable
      end
    end
  end
end
