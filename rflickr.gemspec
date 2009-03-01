Gem::Specification.new do |spec|
  spec.author = 'digital:pardoe'
  spec.email = 'contact@digitalpardoe.co.uk'
  spec.date = '2009-06-02'
  spec.version = '1.1.0.0'
  spec.name = 'rflickr'
  spec.has_rdoc = false
  spec.homepage = 'http://github.com/digitalpardoe/rflickr/'
 
  spec.files=%w(
    LICENCE
    README
    lib/flickr/auth.rb
    lib/flickr/base.rb
    lib/flickr/blogs.rb
    lib/flickr/contacts.rb
    lib/flickr/favorites.rb
    lib/flickr/groups.rb
    lib/flickr/interestingness.rb
    lib/flickr/licenses.rb
    lib/flickr/notes.rb
    lib/flickr/people.rb
    lib/flickr/photos.rb
    lib/flickr/photosets.rb
    lib/flickr/pools.rb
    lib/flickr/reflection.rb
    lib/flickr/tags.rb
    lib/flickr/transform.rb
    lib/flickr/upload.rb
    lib/flickr/urls.rb
    lib/flickr.rb)
 
  spec.summary = 'rFlickr is a Ruby interface to the Flickr API'
  spec.description =<<EOM
rFlickr is a clone of the original RubyForge based rflickr, a Ruby
implementation of the Flickr API. It includes a faithful albeit old
reproduction of the published API.
EOM
end