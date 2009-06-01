require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flickr do
	before(:each) do
		@flickr = Flickr.new('token_cache', 'api_key', 'shared_secret')
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

	it "should sucesfully create all sub-objects" do
		@flickr.groups.members.should_not == nil
		@flickr.groups.pools.should_not == nil
		@flickr.photos.comments.should_not == nil
		@flickr.photos.geo.should_not == nil
		@flickr.photos.licenses.should_not == nil
		@flickr.photos.notes.should_not == nil
		@flickr.photos.transform.should_not == nil
		@flickr.photos.upload.should_not == nil
		@flickr.photosets.comments.should_not == nil
	end

	it "should not have nil parameters" do
		@flickr.activity.api_key.should_not == nil
		@flickr.auth.api_key.should_not == nil
	end

	it "should have matching class variables in all api classes" do
		@flickr.activity.api_key.should == @flickr.auth.api_key
	end

	it "should have different class instance variables in all api classes" do
		@flickr.activity.api.hash.should_not == @flickr.auth.api.hash
	end

	it "should have something in the api hash already" do
		@flickr.activity.api.arguments['format'].should_not == nil
	end

	it "should make the api request but return a failed object" do
		@flickr.test.echo['stat'].should == 'fail'
	end
end

