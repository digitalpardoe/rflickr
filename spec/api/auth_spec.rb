require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Auth do
	before(:each) do
		file_path = File.dirname(__FILE__) + '/../config/api.yml'

		if (File.exists?(file_path))
			api_data = File.open(file_path) { |yf| YAML::load( yf ) }
		else
			raise IOError, 'you need to create the data/api.yml file containing your details first'
		end

		@flickr = Flickr.new(api_data['api_key'], api_data['shared_secret'], { :auth_token => api_data['auth_token'], :extended => true })
	end

	it "should sucessfully check the auth token" do
		@flickr.auth.check_token['stat'].should == 'ok'
	end

	it "should sucessfully get the frob" do
		@flickr.auth.get_frob['stat'].should == 'ok'
	end
end

