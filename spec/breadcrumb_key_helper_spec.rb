# frozen_string_literal: true

require "breadcrumb_key/helper"

# DummyClass simulates a class that includes the BreadcrumbKey::Helper module for testing purposes.
class DummyClass
  include BreadcrumbKey::Helper
  attr_accessor :action_name, :controller_path
end

RSpec.describe BreadcrumbKey::Helper do
  let(:dummy) { DummyClass.new }

  shared_examples "generates_correct_key" do |action, controller_path, expected_key|
    it "returns :#{expected_key} for #{controller_path}##{action} action" do
      dummy.attributes = { controller_path: controller_path, action_name: action }
      expect(dummy.breadcrumb_key).to eq(expected_key.to_sym)
    end
  end

  context "items actions" do
    controller_path = "items"

    it_behaves_like "generates_correct_key", "index", controller_path, "items_index"
    it_behaves_like "generates_correct_key", "show", controller_path, "items_show"
    it_behaves_like "generates_correct_key", "edit", controller_path, "items_edit"
    it_behaves_like "generates_correct_key", "new", controller_path, "items_new"
    it_behaves_like "generates_correct_key", "create", controller_path, "items_new"
    it_behaves_like "generates_correct_key", "update", controller_path, "items_show"
    it_behaves_like "generates_correct_key", "destroy", controller_path, "items_destroy"
  end

  context "deeply nested controller path" do
    expected_key = "admin_user_products_someaction"

    it_behaves_like "generates_correct_key", "someaction", "admin/user/products", expected_key
  end
end
