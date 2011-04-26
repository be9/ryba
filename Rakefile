require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "ryba"
    s.summary = %Q{Russian faker}
    s.email = "olegdashevskii@gmail.com"
    s.homepage = "http://github.com/be9/ryba"
    s.description = "Russian names and addresses generator"
    s.authors = ["oleg dashevskii"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'ryba'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rspec/core/rake_task'
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
