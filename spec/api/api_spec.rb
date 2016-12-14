require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Api" do
  before(:each) do
    @flickr = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
  end

  it "should (probably) fail but not error" do
    @flickr.api.login_link
    @flickr.api.get_token['stat'].should == 'fail'
  end

  it "should raise an error when getting token without login_link" do
    lambda { @flickr.api.get_token }.should raise_error(ArgumentError)
  end
end
