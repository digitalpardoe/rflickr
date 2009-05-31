# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rflickr}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["digital:pardoe"]
  s.date = %q{2009-05-31}
  s.description = %q{rFlickr is a clone of the original RubyForge based rflickr, a Ruby implementation of the Flickr API. It includes a faithful albeit old reproduction of the published API.}
  s.email = %q{contact@digitalpardoe.co.uk}
  s.files = [
    "lib/api/activity.rb",
     "lib/api/auth.rb",
     "lib/api/blogs.rb",
     "lib/api/collections.rb",
     "lib/api/commons.rb",
     "lib/api/contacts.rb",
     "lib/api/favorites.rb",
     "lib/api/groups.rb",
     "lib/api/groups/members.rb",
     "lib/api/groups/pools.rb",
     "lib/api/interestingness.rb",
     "lib/api/machinetags.rb",
     "lib/api/panda.rb",
     "lib/api/people.rb",
     "lib/api/photos.rb",
     "lib/api/photos/comments.rb",
     "lib/api/photos/geo.rb",
     "lib/api/photos/licenses.rb",
     "lib/api/photos/notes.rb",
     "lib/api/photos/transform.rb",
     "lib/api/photos/upload.rb",
     "lib/api/photosets.rb",
     "lib/api/photosets/comments.rb",
     "lib/api/places.rb",
     "lib/api/prefs.rb",
     "lib/api/reflection.rb",
     "lib/api/tags.rb",
     "lib/api/test.rb",
     "lib/api/urls.rb",
     "lib/flickr.rb"
  ]
  s.homepage = %q{http://github.com/digitalpardoe/rflickr}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{rFlickr is a Ruby interface to the Flickr API}
  s.test_files = [
    "spec/flickr_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
  end
end
