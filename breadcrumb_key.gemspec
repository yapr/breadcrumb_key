# frozen_string_literal: true

require_relative "lib/breadcrumb_key/version"

Gem::Specification.new do |spec|
  spec.name = "breadcrumb_key"
  spec.version = BreadcrumbKey::VERSION
  spec.authors = ["yamitake"]
  spec.email = ["take.yapr@gmail.com"]

  spec.summary = "A gem for generating consistent breadcrumb keys in Rails applications."
  spec.description = <<~DESC
    BreadcrumbKey provides a straightforward way to generate consistent and
    standardized breadcrumb keys for Rails applications. It's optimized for
    smooth integration with breadcrumb generation libraries, especially Gretel.
    By offering flexible configurations, it ensures breadcrumb management
    is seamless and efficient.
  DESC
  spec.homepage = "https://github.com/yapr/breadcrumb_key"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/yapr/breadcrumb_key/commits/main"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
