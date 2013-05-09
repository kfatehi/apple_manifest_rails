module AppleManifestRails
  class TemplateDir
    attr_accessor :dir
    class InvalidTemplateDirError < StandardError ; end
    class TemplateMissingError < StandardError ; end
    EXPECTED_TEMPLATES = %w{Profile.mobileconfig manifest.plist}

    def initialize dir
      errors = []
      self.dir = File.expand_path(dir.to_s)
      if File.directory?(self.dir)
        EXPECTED_TEMPLATES.each do |t|
          path = self.join(t)
          unless File.exists?(path)
            errors << "Template missing! #{path}"
          end
        end
      else
        raise InvalidTemplateDirError, "Expected a template directory! #{self.dir}"
      end
      if errors.size > 0
        raise TemplateMissingError, errors.join("\n")
      end
    end

    def join *args
      File.join(self.dir, args)
    end
  end
end