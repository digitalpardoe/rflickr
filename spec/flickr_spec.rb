require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flickr do
	before(:each) do
		@flickr_auth = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], :auth_token => @@api_data['auth_token'])
		@flickr_norm = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'])
	end

	it "should sucesfully create all objects" do
		@flickr_auth.activity.should_not == nil
		@flickr_auth.auth.should_not == nil
		@flickr_auth.blogs.should_not == nil
		@flickr_auth.collections.should_not == nil
		@flickr_auth.commons.should_not == nil
		@flickr_auth.contacts.should_not == nil
		@flickr_auth.favorites.should_not == nil
		@flickr_auth.groups.should_not == nil
		@flickr_auth.interestingness.should_not == nil
		@flickr_auth.machinetags.should_not == nil
		@flickr_auth.panda.should_not == nil
		@flickr_auth.people.should_not == nil
		@flickr_auth.photos.should_not == nil
		@flickr_auth.photosets.should_not == nil
		@flickr_auth.places.should_not == nil
		@flickr_auth.prefs.should_not == nil
		@flickr_auth.reflection.should_not == nil
		@flickr_auth.test.should_not == nil
		@flickr_auth.tags.should_not == nil
		@flickr_auth.urls.should_not == nil
	end

	it "should sucesfully create all sub-objects" do
		@flickr_auth.groups.members.should_not == nil
		@flickr_auth.groups.pools.should_not == nil
		@flickr_auth.photos.comments.should_not == nil
		@flickr_auth.photos.geo.should_not == nil
		@flickr_auth.photos.licenses.should_not == nil
		@flickr_auth.photos.notes.should_not == nil
		@flickr_auth.photos.transform.should_not == nil
		@flickr_auth.photos.upload.should_not == nil
		@flickr_auth.photosets.comments.should_not == nil
	end

	it "should connect and make api request" do
		(@flickr_auth.test.echo['stat'] == 'fail' ? true : (@flickr_auth.test.echo['stat'].should == 'ok' ? true : false)).should == true
	end

	it "should make authorized request" do
		@flickr_auth.test.login['stat'].should == 'ok'
	end

	it "should not make authorized request" do
		@flickr_auth.auth_token('some_token').test.login['stat'].should == 'fail'
	end

	it "should not raise an error on authorized method with nil token" do
		@flickr_auth.auth_token(nil).test.login['stat'].should == 'fail'
	end

	it "should not make an authorized request" do
		@flickr_norm.test.login['stat'].should == 'fail'
	end

	it "should make a normal request" do
		@flickr_norm.test.echo['stat'].should == 'ok'
	end

	it "should pull back a nil" do
		@flickr_auth.test.null.should == nil
	end
end

