require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Commons" do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
	end

	it "should sucessfully get institutions" do
		@flickr.flickr_commons_getInstitutions['stat'].should == 'ok'
	end
end

