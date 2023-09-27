# frozen_string_literal: true

require "rails_helper"

RSpec.describe BreadcrumbKey::Helper do
  class DummyClass
    include BreadcrumbKey::Helper

    attr_accessor :action_name, :controller_path
  end

  let(:dummy) { DummyClass.new }

  describe "#breadcrumb_key" do
    context 'when action_name is "create" and controller_path is "users"' do
      before do
        dummy.action_name = "create"
        dummy.controller_path = "users"
      end

      it "returns :users_new" do
        expect(dummy.breadcrumb_key).to eq(:users_new)
      end
    end

    # 同様のテストを他のaction_nameやcontroller_pathの組み合わせについても追加してください。
  end
end
