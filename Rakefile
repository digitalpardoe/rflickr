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
		gem.add_dependency('json', '>= 1.1.5')
		gem.has_rdoc = false
		gem.rdoc_options = nil
		gem.extra_rdoc_files = ''
	end
rescue LoadError
	puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
	test.libs << 'lib' << 'test'
	test.pattern = 'test/**/*_test.rb'
	test.verbose = true
end

task :default => :test
