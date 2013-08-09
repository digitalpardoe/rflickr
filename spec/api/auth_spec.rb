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

	it "should (probably) fail but not error" do
		@flickr.auth_ext.login_link
		@flickr.auth_ext.get_token['stat'].should == 'fail'
	end

	it "should raise an error when getting token without login_link" do
		lambda { @flickr.auth_ext.get_token }.should raise_error(ArgumentError)
	end
end

