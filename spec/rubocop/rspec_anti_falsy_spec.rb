# frozen_string_literal: true

RSpec.describe RuboCop::RspecAntiFalsy do
  it "has a version number" do
    expect(RuboCop::RspecAntiFalsy::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
