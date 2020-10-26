# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'
require 'rubocop/formatter/checkstyle_formatter'
require 'test-unit'
require 'ci/reporter/rake/test_unit'



task default: %i[hello rubocop test]

desc 'Run tests'
task :hello do
  puts 'Hello world'
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new do |t|
    config_file = './lib/tasks/rubocop.yml'
    t.options = ['-c', config_file,
                 '--fail-level', 'F',
                 '--format', 'RuboCop::Formatter::CheckstyleFormatter', '-o', './reports/xml/checkstyle-result.xml',
                 '--format', 'html', '-o', './reports/html/index.html']
  end
end

task test: :'ci:setup:testunit' do
  Rake::TestTask.new  do |t|
    t.libs << 'test'
    t.test_files = FileList['test/tc_*.rb']
    t.verbose = true
  end
end