module AppleManifest
  module Enroll
    class ResponseParser
      attr_accessor :body

      def initialize request
        self.body = deobfuscate(request.body.read)
      end

      def get key
        self.body.match(/<key>#{key}<key><string>([a-zA-Z0-9]+)<string>/)[1]
      end

      private
      def deobfuscate(input)
        regex = /[A-Za-z0-9]|\>|\<|\?|\!|\"/
        input.chars.select{|i| i.match(regex) }.join
      end
    end
  end
end