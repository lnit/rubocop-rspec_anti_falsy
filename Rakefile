# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

task default: %i[spec]

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList["spec/**/*_spec.rb"]
end

desc "Generate a new cop with a template"
task :new_cop, [:cop] do |_task, args|
  require "rubocop"

  cop_name = args.fetch(:cop) do
    warn "usage: bundle exec rake new_cop[Department/Name]"
    exit!
  end

  generator = RuboCop::Cop::Generator.new(cop_name)

  generator.write_source
  generator.write_spec
  generator.inject_require(root_file_path: "lib/rubocop/cop/rspec_anti_falsy_cops.rb")
  generator.inject_config(config_file_path: "config/default.yml")

  puts generator.todo
end
