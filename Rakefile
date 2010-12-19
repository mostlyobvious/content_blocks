require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "content_blocks"
  gem.homepage = "http://github.com/pawelpacana/content_blocks"
  gem.license = "MIT"
  gem.summary = %Q{Content parts models for your site.}
  gem.description = %Q{Content blocks are commonly used models representing editable page partials.}
  gem.email = "pawel.pacana@gmail.com"
  gem.authors = ["Paweł Pacana"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'aasm', '~> 2.2.0'
  gem.add_runtime_dependency 'RedCloth', '~> 4.2.3'
  gem.add_runtime_dependency 'activerecord', '>= 3.0'
  gem.add_development_dependency 'rspec', '>= 2.1.0'
  gem.add_development_dependency 'rspec-rails', '>= 2.1.0'
  gem.add_development_dependency 'sqlite3-ruby'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "content_blocks #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
