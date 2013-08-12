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
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "digitalpardoe-rflickr"
  gem.homepage = "http://github.com/digitalpardoe/rflickr"
  gem.summary = "rFlickr is a Ruby interface to the Flickr API"
  gem.description = "rFlickr is a connector to the Flickr API, it doesn't do much but it should make working with the Flickr API easier."
  gem.email = "contact@digitalpardoe.co.uk"
  gem.authors = ["Alex Pardoe"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
	spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
	spec.pattern = 'spec/**/*_spec.rb'
	spec.rcov = true
	spec.rcov_opts = ['--exclude', 'spec,.*/.gem']
end

task :default => :test