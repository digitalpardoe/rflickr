require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Auth" do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
	end

	it "should sucessfully check the auth token" do
		@flickr.flickr_auth_checkToken(auth: true)['stat'].should == 'ok'
	end

	it "should sucessfully get the frob" do
		@flickr.flickr_auth_getFrob['stat'].should == 'ok'
	end
end

