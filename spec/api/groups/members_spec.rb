require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Members do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], { :auth_token => Flickr.class_variable_get(:@@api_data)['auth_token'], :extended => true })
	  @group_id = @flickr.groups.search('Nikon')['groups']['group'][0]['nsid']
	end

	it "should be able to get the members list" do
		@flickr.groups.members.get_list(@group_id, [2])['stat'].should == 'ok'
	end
	
	it "should error becuase of invalid member types" do
		lambda { @flickr.groups.members.get_list(@group_id, [2, 6])['stat'] }.should raise_error(ArgumentError)
	end
	
	it "should be able to get the members list without member types" do
		@flickr.groups.members.get_list(@group_id)['stat'].should == 'ok'
  end
end