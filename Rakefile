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
  gem.name        = "gopollgo"
  gem.homepage    = "http://github.com/gopollgo/gopollgo"
  gem.license     = "MIT"
  gem.summary     = 'A Ruby wrapper to the GoPollGo API.'
  gem.description = 'A Ruby wrapper to the GoPollGo API for creating polls.'
  gem.email       = "dev@gopollgo.com"
  gem.authors     = ["Ben Schaechter"]
  gem.require_paths = %w(lib)
  gem.add_dependency "httparty", "~> 0.7.8"
  gem.add_development_dependency "rspec", "~> 2.0"
  
  gem.files = %(README LICENSE VERSION)
  gem.files += Dir.glob("lib/*")
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gopollgo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
