# RuboCop::RspecAntiFalsy

RuboCop Plugin for RSpec to avoid using `be_truthy` and `be_falsy` matcher.

```ruby
# bad
expect(subject).to be_truthy

# good
expect(subject).to be true
```

```ruby
# bad
expect(subject).to be_falsy

# good
expect(subject).to be false
```


## Installation

Just install the `rubocop-rspec_anti_falsy` gem

```bash
gem install rubocop-rspec_anti_falsy
```

or if you use bundler put this in your `Gemfile`

```ruby
gem "rubocop-rspec_anti_falsy", require: false
```

## Usage

You need to tell RuboCop to load the extension.

### RuboCop configuration file

Put this into your `.rubocop.yml`:

```yaml
plugins:
  - rubocop-rspec_anti_falsy
```

### Command line

```bash
rubocop --require rubocop-rspec_anti_falsy
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rubocop-rspec_anti_falsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rubocop-rspec_anti_falsy/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rubocop::RspecAntiFalsy project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rubocop-rspec_anti_falsy/blob/main/CODE_OF_CONDUCT.md).
