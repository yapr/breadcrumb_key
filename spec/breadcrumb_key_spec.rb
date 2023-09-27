# frozen_string_literal: true

RSpec.describe BreadcrumbKey do
  it "has a version number" do
    expect(BreadcrumbKey::VERSION).not_to be nil
  end

  it "allows access to auto_include_helpers configuration" do
    expect(BreadcrumbKey.auto_include_helpers?).to eq(true)
  end
end
