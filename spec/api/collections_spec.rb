require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Collections" do
  before(:each) do
    @flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
  end

  it "should successfully retrieve the collection tree" do
    @flickr.flickr_collections_getTree(auth: true)['stat'].should == 'ok'
  end

  it "should successfully retrieve the collection information" do
    set_id = @flickr.flickr_collections_getTree(auth: true)['collections']['collection'][0]['id']
    @flickr.flickr_collections_getInfo(args: { collection_id: set_id }, auth: true)['stat'].should == 'ok'
  end
end
