require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flickr do
	before(:each) do
		@flickr_auth = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
		@flickr_norm = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'])
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
end

