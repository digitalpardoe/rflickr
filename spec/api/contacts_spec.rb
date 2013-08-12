require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Contacts" do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
	end

	it "should sucessfully get the list of contacts" do
		@flickr.flickr_contacts_getList(auth: true)['stat'].should == 'ok'
	end

	it "should sucessfully get the recently uploaded list" do
		@flickr.flickr_contacts_getListRecentlyUploaded(auth: true)['stat'].should == 'ok'
	end
end

