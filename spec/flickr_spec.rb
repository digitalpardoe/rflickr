require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Flickr do
  before(:each) do
    @flickr_auth = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'], Flickr.class_variable_get(:@@api_data)['auth_token'])
    @flickr_norm = Flickr.new(Flickr.class_variable_get(:@@api_data)['api_key'], Flickr.class_variable_get(:@@api_data)['shared_secret'])
  end

  it "should connect and make api request" do
    (@flickr_auth.flickr_test_echo['stat'] == 'fail' ? true : (@flickr_auth.flickr_test_echo['stat'].should == 'ok' ? true : false)).should == true
  end

  it "should make authorized request" do
    @flickr_auth.flickr_test_login(auth: true)['stat'].should == 'ok'
  end

  it "should not make authorized request" do
    @flickr_auth.auth_token('some_token').flickr_test_login(auth: true)['stat'].should == 'fail'
  end

  it "should not raise an error on authorized method with nil token" do
    @flickr_auth.auth_token(nil).flickr_test_login(auth: true)['stat'].should == 'fail'
  end

  it "should not make an authorized request" do
    @flickr_norm.flickr_test_login['stat'].should == 'fail'
  end

  it "should make a normal request" do
    @flickr_norm.flickr_test_echo['stat'].should == 'ok'
  end
end
