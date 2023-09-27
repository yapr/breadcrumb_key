# frozen_string_literal: true

# BreadcrumbKey module serves as a namespace for all related functionality.
module BreadcrumbKey
  # The Helper module provides utility methods for generating breadcrumb keys
  # based on the current controller and action.
  module Helper
    # Generates a key for breadcrumbs based on the normalized controller path
    # and action name.
    #
    # @return [Symbol] the generated breadcrumb key
    def breadcrumb_key
      "#{normalized_controller_path}_#{normalized_action_name}".to_sym
    end

    private

    # Converts the controller path to a format suitable for breadcrumb key generation.
    # This primarily involves replacing slashes with underscores.
    #
    # @return [String] the normalized controller path
    def normalized_controller_path
      controller_path.tr("/", "_")
    end

    # Retrieves the action name in a format suitable for breadcrumb key generation.
    # Specific actions like 'create' and 'update' are mapped to more general ones
    # like 'new' and 'show' respectively.
    #
    # @return [String] the normalized action name
    def normalized_action_name
      case action_name
      when "create"
        "new"
      when "update"
        "show"
      else
        action_name
      end
    end
  end
end
