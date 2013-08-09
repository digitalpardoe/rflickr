# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "digitalpardoe-rflickr"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["digital:pardoe"]
  s.date = "2013-08-09"
  s.description = "rFlickr is a clone of the original RubyForge based rflickr, a Ruby implementation of the Flickr API. It includes a faithful albeit old reproduction of the published API."
  s.email = "contact@digitalpardoe.co.uk"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "digitalpardoe-rflickr.gemspec",
    "lib/flickr.rb",
    "lib/flickr/auth.rb",
    "lib/flickr/base.rb",
    "lib/flickr/blogs.rb",
    "lib/flickr/contacts.rb",
    "lib/flickr/favorites.rb",
    "lib/flickr/groups.rb",
    "lib/flickr/interestingness.rb",
    "lib/flickr/licenses.rb",
    "lib/flickr/notes.rb",
    "lib/flickr/people.rb",
    "lib/flickr/photos.rb",
    "lib/flickr/photosets.rb",
    "lib/flickr/pools.rb",
    "lib/flickr/reflection.rb",
    "lib/flickr/tags.rb",
    "lib/flickr/transform.rb",
    "lib/flickr/upload.rb",
    "lib/flickr/urls.rb",
    "test/test_suite.rb"
  ]
  s.homepage = "http://github.com/digitalpardoe/rflickr"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "rFlickr is a Ruby interface to the Flickr API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<digitalpardoe-rflickr>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
    else
      s.add_dependency(%q<digitalpardoe-rflickr>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<mime-types>, [">= 0"])
    end
  else
    s.add_dependency(%q<digitalpardoe-rflickr>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<mime-types>, [">= 0"])
  end
end

