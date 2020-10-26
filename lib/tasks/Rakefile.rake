# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'


task default: %i[hello rubocop test]

desc 'Run tests'
task :hello do
  puts 'Hello world'
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new do |t|
    config_file = './lib/tasks/rubocop.yml'
    t.options = ['-c', config_file, '--fail-level', 'F']
  end
end

Rake::TestTask.new do |t|
  t.libs << 'Tests'
  t.test_files = FileList['Tests/tc_*.rb']
  t.verbose = true
end

