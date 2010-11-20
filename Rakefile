require 'rubygems'
require 'rake'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "rflickr"
		gem.summary = "rFlickr is a Ruby interface to the Flickr API"
		gem.email = "contact@digitalpardoe.co.uk"
		gem.homepage = "http://github.com/digitalpardoe/rflickr"
		gem.authors = ["digital:pardoe"]
		gem.description = "rFlickr is a clone of the original RubyForge based rflickr, a Ruby implementation of the Flickr API. It includes a faithful albeit old reproduction of the published API."
		gem.add_dependency('json')
		gem.has_rdoc = false
		gem.rdoc_options = nil
		gem.extra_rdoc_files = ''
		gem.files = 'lib/**/*'
		gem.test_files = 'spec/**/*'
	end
rescue LoadError
	puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
	spec.pattern = 'spec/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
	spec.pattern = 'spec/**/*_spec.rb'
	spec.rcov = true
	spec.rcov_opts = ['--exclude', 'spec,.*/.gem']
end

task :default => :spec
