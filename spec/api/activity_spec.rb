require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Activity do
	before(:each) do
		@flickr = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], { :auth_token => @@api_data['auth_token'], :extended => true })
	end

	it "should sucessfully get the user comments" do
		@flickr.activity.user_comments['stat'].should == 'ok'
	end
	
	it "should sucessfully get the users photos" do
		@flickr.activity.user_photos['stat'].should == 'ok'
	end
end

