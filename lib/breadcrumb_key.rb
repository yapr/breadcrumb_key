# frozen_string_literal: true

require_relative "breadcrumb_key/version"
require 'breadcrumb_key/railtie' if defined?(Rails)

# This module provides methods related to breadcrumb key generation.
module BreadcrumbKey
  mattr_accessor :auto_include_helpers
  self.auto_include_helpers = false

  def self.setup
    yield self
  end
end
