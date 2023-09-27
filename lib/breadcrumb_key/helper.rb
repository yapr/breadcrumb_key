# frozen_string_literal: true

module BreadcrumbKey
  module Helper
    def breadcrumb_key
      "#{normalized_controller_path}_#{normalized_action_name}".to_sym
    end

    private

    def normalized_controller_path
      controller_path.tr("/", "_")
    end

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
