# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::AvoidBeFalsy, :config do
  it "registers an offense when using `#be_falsy`" do
    expect_offense(<<~RUBY)
      be_falsy
      ^^^^^^^^ Use `#be false` instead of `#be_falsy`.
    RUBY
  end

  it "does not register an offense when using `#be false`" do
    expect_no_offenses(<<~RUBY)
      be false
    RUBY
  end
end
