require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Auth do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], { :auth_token => Flickr.class_variable_get(:@@api_data)['auth_token'], :extended => true })
	end

	it "should sucessfully check the auth token" do
		@flickr.auth.check_token['stat'].should == 'ok'
	end

	it "should sucessfully get the frob" do
		@flickr.auth.get_frob['stat'].should == 'ok'
	end

	it "should (probably) fail but not error" do
		@flickr.auth.login_link
		@flickr.auth.get_token['stat'].should == 'fail'
	end

	it "should raise an error when getting token without login_link" do
		lambda { @flickr.auth.get_token }.should raise_error(ArgumentError)
	end
end

