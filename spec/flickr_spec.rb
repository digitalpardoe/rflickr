require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flickr do
	before(:each) do
		@flickr = Flickr.new('', '', '')
	end

	it "should sucesfully create all objects" do
		@flickr.activity.should_not == nil
		@flickr.auth.should_not == nil
		@flickr.blogs.should_not == nil
		@flickr.collections.should_not == nil
		@flickr.commons.should_not == nil
		@flickr.contacts.should_not == nil
		@flickr.favorites.should_not == nil
		@flickr.groups.should_not == nil
		@flickr.interestingness.should_not == nil
		@flickr.machinetags.should_not == nil
		@flickr.panda.should_not == nil
		@flickr.people.should_not == nil
		@flickr.photos.should_not == nil
		@flickr.photosets.should_not == nil
		@flickr.places.should_not == nil
		@flickr.prefs.should_not == nil
		@flickr.reflection.should_not == nil
		@flickr.test.should_not == nil
		@flickr.tags.should_not == nil
		@flickr.urls.should_not == nil
	end
end

