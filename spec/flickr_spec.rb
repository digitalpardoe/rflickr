require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flickr do
	before(:each) do
		file_path = File.dirname(__FILE__) + '/data/api.yml'

		if (File.exists?(file_path))
			api_data = File.open(file_path) { |yf| YAML::load( yf ) }
		else
			raise IOError, 'you need to create the data/api.yml file containing your details first'
		end
		
		@flickr = Flickr.new(api_data['api_key'], api_data['shared_secret'], api_data['auth_token'])
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
		@flickr.activity.api.key.should_not == nil
		@flickr.auth.api.key.should_not == nil
	end

	it "should have matching class variables in all api classes" do
		@flickr.activity.api.key.should == @flickr.auth.api.key
	end

	it "should have different class instance variables in all api classes" do
		@flickr.activity.api.hash.should_not == @flickr.auth.api.hash
	end

	it "should have something in the api hash already" do
		@flickr.activity.api.arguments['format'].should_not == nil
	end

	it "should connect and make api request" do
		(@flickr.test.echo['stat'] == 'fail' ? true : (@flickr.test.echo['stat'].should == 'ok' ? true : false)).should == true
	end

	it "should make authorized request" do
		@flickr.activity.user_photos['stat'].should == 'ok'
	end
end

