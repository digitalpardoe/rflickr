File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'flickr'

class FlickrTest < Test::Unit::TestCase
  def setup
	  @flickr = Flickr.new('', '', '')
  end

  # A fairly simple test to make sure that I don't mess up the
  # skeleton code in all the classes I've created, more likely
  # to throw an error than fail the test.

  def test_object_creation
	  assert_not_nil(@flickr.activity)
	  assert_not_nil(@flickr.auth)
	  assert_not_nil(@flickr.blogs)
	  assert_not_nil(@flickr.collections)
	  assert_not_nil(@flickr.commons)
	  assert_not_nil(@flickr.contacts)
	  assert_not_nil(@flickr.favorites)
	  assert_not_nil(@flickr.groups)
	  assert_not_nil(@flickr.interestingness)
	  assert_not_nil(@flickr.machinetags)
	  assert_not_nil(@flickr.panda)
	  assert_not_nil(@flickr.people)
	  assert_not_nil(@flickr.photos)
	  assert_not_nil(@flickr.photosets)
	  assert_not_nil(@flickr.places)
	  assert_not_nil(@flickr.prefs)
	  assert_not_nil(@flickr.reflection)
	  assert_not_nil(@flickr.test)
	  assert_not_nil(@flickr.tags)
	  assert_not_nil(@flickr.urls)
  end
end
