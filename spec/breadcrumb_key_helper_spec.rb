# frozen_string_literal: true

require "breadcrumb_key/helper"

RSpec.describe BreadcrumbKey::Helper do
  class DummyClass
    include BreadcrumbKey::Helper

    attr_accessor :action_name, :controller_path
  end

  let(:dummy) { DummyClass.new }

  shared_examples "generates_correct_key" do |action, controller_path, expected_key|
    it "returns :#{expected_key} for #{controller_path}##{action} action" do
      dummy.controller_path = controller_path
      dummy.action_name = action
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
    controller_path = "admin/user/products"
    action = "someaction"
    expected_key = "admin_user_products_someaction"

    it_behaves_like "generates_correct_key", action, controller_path, expected_key
  end
end
