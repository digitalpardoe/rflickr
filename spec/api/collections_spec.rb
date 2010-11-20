require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Collections do
	before(:each) do
		@flickr = Flickr.new(@@api_data['api_key'], @@api_data['shared_secret'], { :auth_token => @@api_data['auth_token'], :extended => true })
	end

	it "should successfully retrieve the collection tree" do
		@flickr.collections.get_tree['stat'].should == 'ok'
	end
	
	it "should successfully retrieve the collection information" do
    set_id = @flickr.collections.get_tree['collections']['collection'][0]['id']
    @flickr.collections.get_info(set_id)['stat'].should == 'ok'
  end
end

