require "apple_manifest_rails/engine"

require "apple_manifest_rails/enroll/mobile_config"
require "apple_manifest_rails/enroll/response_parser"
require "apple_manifest_rails/install/checker"
require "apple_manifest_rails/install/ipa"
require "apple_manifest_rails/template_dir"

module AppleManifestRails
  def self.configure
    yield self
  end

  def self.page_title
    @page_title ||= "AppleManifestRails v#{VERSION}"
  end

  def self.page_title=(str)
    @page_title = str
  end

  def self.template_dir
    @template_dir ||= TemplateDir.new(Rails.root.join('apple_manifest_templates'))
  end

  def self.template_dir=(path)
    @template_dir ||= TemplateDir.new(path.to_s)
  end

  def self.template name
    template_dir.join name
  end

  def self.ipa_path
    @ipa_path ||= template_dir.join('builds', 'app.ipa')
  end

  def self.ipa_path= str
    @ipa_path = str
  end
end
