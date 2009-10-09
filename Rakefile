require 'rubygems'
require 'rake'

begin
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
rescue LoadError
	puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
	test.libs << 'lib' << 'test'
	test.pattern = 'test/**/*_test.rb'
	test.verbose = true
end

begin
	require 'rcov/rcovtask'
	Rcov::RcovTask.new do |test|
		test.libs << 'test'
		test.pattern = 'test/**/*_test.rb'
		test.verbose = true
	end
rescue LoadError
	task :rcov do
		abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
	end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
	if File.exist?('VERSION.yml')
		config = YAML.load(File.read('VERSION.yml'))
		version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
	else
		version = ""
	end

	rdoc.rdoc_dir = 'rdoc'
	rdoc.title = "rflickr #{version}"
	rdoc.rdoc_files.include('README*')
	rdoc.rdoc_files.include('LICENSE*')
	rdoc.rdoc_files.include('lib/**/*.rb')
end

