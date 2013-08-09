# encoding: utf-8

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
		gem.name = "digitalpardoe-rflickr"
		gem.summary = "rFlickr is a Ruby interface to the Flickr API"
		gem.email = "contact@digitalpardoe.co.uk"
		gem.homepage = "http://github.com/digitalpardoe/rflickr"
		gem.authors = ["digital:pardoe"]
		gem.description = "rFlickr is a clone of the original RubyForge based rflickr, a Ruby implementation of the Flickr API. It includes a faithful albeit old reproduction of the published API."
		gem.add_dependency('mime-types')
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "digitalpardoe-rflickr #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
