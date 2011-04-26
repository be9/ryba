require 'bundler'
require 'rake/rdoctask'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'ryba'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.ruby_opts = '-I lib -I spec'
  t.rspec_opts = '--colour'
end

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.rspec_opts = '--colour'
  t.ruby_opts = '-I lib -I spec'
end

task :default => :spec
