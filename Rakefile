require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'yard'
require 'yard/rake/yardoc_task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new
YARD::Rake::YardocTask.new

task default: [:rubocop, :spec, :yard]
