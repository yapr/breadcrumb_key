require 'breadcrumb_key/helper'
require 'rails'

module BreadcrumbKey
  class Railtie < Rails::Railtie
    initializer "breadcrumb_key.view_helpers" do
      ActiveSupport.on_load :action_view do
        include BreadcrumbKey::Helper if BreadcrumbKey.auto_include_helpers?
      end
    end
  end
end