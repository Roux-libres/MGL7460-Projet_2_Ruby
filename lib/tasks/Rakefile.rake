# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'
require 'rubocop/formatter/checkstyle_formatter'
require 'test-unit'
require 'ci/reporter/rake/test_unit'
require 'launchy'

desc 'Default build'
task default: %i[rubocop_html test]

desc 'Jenkins build'
task jenkins: %i[rubocop test]

desc 'Run rubocop with html reports'
task :rubocop_html do
  RuboCop::RakeTask.new do |t|
    config_file = './lib/tasks/rubocop.yml'
    t.options = ['-c', config_file,
                 '--fail-level', 'F',
                 '--format', 'html', '-o', './reports/html/index.html']
  end
  Launchy.open('./reports/html/index.html')
end

desc 'Run rubocop with all reports'
task :rubocop do
  RuboCop::RakeTask.new do |r|
    config_file = './lib/tasks/rubocop.yml'
    r.options = ['-c', config_file,
                 '--fail-level', 'F',
                 '--format', 'RuboCop::Formatter::CheckstyleFormatter', '-o', './reports/xml/checkstyle-result.xml',
                 '--format', 'html', '-o', './reports/html/index.html']
  end
end

desc 'Run all tests with xml reports thanks to ci reporter'
task test: :'ci:setup:testunit' do
  Rake::TestTask.new do |t|
    t.pattern = 'test/test_*.rb'
    t.verbose = true
  end
end