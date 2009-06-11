require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Favorites do
	before(:each) do
		@flickr = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], { :auth_token => @@api_data['auth_token'], :extended => true })
	end

	it "should be able to get the list" do
		@flickr.favorites.get_list['stat'].should == 'ok'
	end

	it "should throw an exception when getting the list" do
		lambda { @flickr.favorites.get_list(nil, nil, nil, 'something', nil, nil)['stat'] }.should raise_error
	end
end
