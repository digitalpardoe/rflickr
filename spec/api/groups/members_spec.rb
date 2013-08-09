require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Groups/Member" do
	before(:each) do
		@flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
	  @group_id = @flickr.flickr_groups_search(args: { text: "Nikon" })['groups']['group'][0]['nsid']
	end

	it "should be able to get the members list" do
		@flickr.flickr_groups_members_getList(args: { group_id: @group_id, membertypes: [2] }, auth: true)['stat'].should == 'ok'
	end
	
	it "should be able to handle an array of member types" do
		@flickr.flickr_groups_members_getList(args: { group_id: @group_id, membertypes: [2, 3] }, auth: true)['stat'].should == 'ok'
	end
	
	it "should be able to get the members list without member types" do
		@flickr.flickr_groups_members_getList(args: { group_id: @group_id }, auth: true)['stat'].should == 'ok'
  end
end