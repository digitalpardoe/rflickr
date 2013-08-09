require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Favorites" do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
	end

	it "should be able to get the list" do
		@flickr.flickr_favorites_getList(auth: true)['stat'].should == 'ok'
	end
end
