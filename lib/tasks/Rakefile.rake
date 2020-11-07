# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'
require 'rubocop/formatter/checkstyle_formatter'
require 'test-unit'
require 'ci/reporter/rake/test_unit'
require 'launchy'

desc 'Default build'
task default: %i[test]

desc 'Jenkins build'
task jenkins: %i[rubocop test]

config_file = './lib/tasks/rubocop.yml'
out_file_xml = './reports/xml/checkstyle-result.xml'
out_file_html = './reports/html/index.html'

desc 'Run rubocop with html reports'
task :rubocop do
  RuboCop::RakeTask.new do |t|
    t.options = ['-c', config_file,
                 '--fail-level', 'F',
                 '--format', 'RuboCop::Formatter::CheckstyleFormatter', '-o', out_file_xml]
  end
end

desc 'Run all tests with xml reports thanks to ci reporter'
task test: :'ci:setup:testunit' do
  Rake::TestTask.new do |t|
    t.pattern = 'test/test_*.rb'
    t.verbose = true
  end
end
