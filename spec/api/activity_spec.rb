require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Activity" do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
	end

	it "should sucessfully get the user comments" do
		@flickr.flickr_activity_userComments(auth: true)['stat'].should == 'ok'
	end
	
	it "should sucessfully get the users photos" do
		@flickr.flickr_activity_userPhotos(auth: true)['stat'].should == 'ok'
	end
end

