require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Blogs do
	before(:each) do
		@flickr = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], { :auth_token => @@api_data['auth_token'], :extended => true })
	end

	it "should be able to get the blog list" do
		@flickr.blogs.get_list['stat'].should == 'ok'
	end
end

