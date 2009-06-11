require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contacts do
	before(:each) do
		@flickr = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], { :auth_token => @@api_data['auth_token'], :extended => true })
	end

	it "should sucessfully get the list of contacts" do
		@flickr.contacts.get_list['stat'].should == 'ok'
	end

	it "should sucessfully get the recently uploaded list" do
		@flickr.contacts.get_list_recently_uploaded['stat'].should == 'ok'
	end

	it "should throw an argument error when getting the list" do
		lambda { @flickr.contacts.get_list('something', nil, nil) }.should raise_error(ArgumentError)
	end

	it "should throw an arugment error when getting the recently uploaded list" do
		lambda { @flickr.contacts.get_list_recently_uploaded(nil, 'something') }.should raise_error(ArgumentError)
	end
end

