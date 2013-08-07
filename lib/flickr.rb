Dir[File.dirname(__FILE__) + "/api/**/*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/core/**/*.rb"].each { |file| require file }

class Flickr
	def initialize(api_key, shared_secret, args=nil)
		@tokens = Flickr::Tokens.new(api_key, shared_secret, args ? args[:auth_token] : nil)
		@extended_api = args ? args[:extended] || false : false
		@api_request = FlickrApiRequest.new(@tokens)
	end

	def auth_token(auth_token)
		@tokens.auth_token = auth_token
		self
	end

	class Tokens
		attr_reader :api_key, :shared_secret
		attr_accessor :auth_token

		def initialize(api_key, shared_secret, auth_token)
			@api_key = api_key
			@shared_secret = shared_secret
			@auth_token = auth_token
		end
	end

	# Create instances of all the other classes to allow us to simulate
	# the Flickr API 'flickr.class.method' convention.

	def auth
		@auth ||= @extended_api ? AuthExt.new(@api_request) : Auth.new(@api_request)
	end

  def test
    @test ||= ApiTest.new(@api_request)
  end

  def method_missing(methods, *args, &blk)
    eval("@#{methods} ||= #{methods.capitalize}.new(@api_request)")
  end
end