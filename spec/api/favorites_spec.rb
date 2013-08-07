require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Favorites do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], { :auth_token => Flickr.class_variable_get(:@@api_data)['auth_token'], :extended => true })
	end

	it "should be able to get the list" do
		@flickr.favorites.get_list['stat'].should == 'ok'
	end
end
