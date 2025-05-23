# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::AvoidBeTruthy, :config do
  it "registers an offense when using `#be_truthy`" do
    expect_offense(<<~RUBY)
      be_truthy
      ^^^^^^^^^ Use `#be true` instead of `#be_truthy`.
    RUBY
  end

  it "does not register an offense when using `#be true`" do
    expect_no_offenses(<<~RUBY)
      be true
    RUBY
  end
end
