# frozen_string_literal: true

require "breadcrumb_key/helper"
require "rails"

module BreadcrumbKey
  # Railtie integrates BreadcrumbKey::Helper with Rails' ActionView,
  # based on the `BreadcrumbKey.auto_include_helpers` configuration.
  class Railtie < Rails::Railtie
    initializer "breadcrumb_key.view_helpers" do
      ActiveSupport.on_load :action_view do
        include BreadcrumbKey::Helper if BreadcrumbKey.auto_include_helpers?
      end
    end
  end
end
