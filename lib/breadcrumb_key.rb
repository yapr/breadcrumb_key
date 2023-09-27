# frozen_string_literal: true

require_relative "breadcrumb_key/version"

# This module provides methods related to breadcrumb key generation.
module BreadcrumbKey
  class Error < StandardError; end
  extend ActiveSupport::Concern

  included do
    helper_method :breadcrumb_key
  end

  def breadcrumb_key
    "#{normalized_controller_path}_#{normalized_action_name}".to_sym
  end

  private

  def normalized_controller_path
    controller_path.tr('/', '_')
  end

  def normalized_action_name
    case action_name
    when 'create'
      'new'
    when 'update'
      'show'
    else
      action_name
    end
  end
end
