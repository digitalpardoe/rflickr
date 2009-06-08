require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Auth do
	before(:each) do
		@flickr = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], { :auth_token => @@api_data['auth_token'], :extended => true })
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
end

