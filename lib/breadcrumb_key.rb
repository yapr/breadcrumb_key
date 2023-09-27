# frozen_string_literal: true

require_relative "breadcrumb_key/version"
require "breadcrumb_key/railtie" if defined?(Rails)

# This module provides methods related to breadcrumb key generation.
module BreadcrumbKey
  class << self
    attr_accessor :auto_include_helpers

    def auto_include_helpers?
      auto_include_helpers
    end
  end

  self.auto_include_helpers = true
end
