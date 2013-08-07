require 'api/base/activity'
require 'api/base/auth'
require 'api/base/blogs'
require 'api/base/collections'
require 'api/base/commons'
require 'api/base/contacts'
require 'api/base/favorites'
require 'api/base/groups'
require 'api/base/interestingness'
require 'api/base/machinetags'
require 'api/base/panda'
require 'api/base/people'
require 'api/base/photos'
require 'api/base/photosets'
require 'api/base/places'
require 'api/base/prefs'
require 'api/base/reflection'
require 'api/base/tags'
require 'api/base/test'
require 'api/base/urls'

require 'api/ext/auth'

require 'core/interaction/flickr_api_request'

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