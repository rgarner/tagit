# encoding: utf-8
#!/usr/bin/env rake

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
  gem.name = "tagit"
  gem.homepage = "http://github.com/rgarner/tagit"
  gem.license = "MIT"
  gem.summary = %Q{Version your project with git tag}
  gem.description = %Q{Use git to manage your rationally-versioned releases}
  gem.email = "rgarner@zephyros-systems.co.uk"
  gem.authors = ["Russell Garner"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Tagit'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('lib/**/*.rb')
end
