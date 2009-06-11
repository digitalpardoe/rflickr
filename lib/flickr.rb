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

	def activity
		@activity ||= Activity.new(@api_request)
	end
	
	def auth
		@auth ||= @extended_api ? AuthExt.new(@api_request) : Auth.new(@api_request)
	end

	def blogs
		@blogs ||= Blogs.new(@api_request)
	end

	def collections
		@collections ||= Collections.new(@api_request)
	end

	def commons
		@commons ||= Commons.new(@api_request)
	end

	def contacts
		@contacts ||= Contacts.new(@api_request)
	end

	def favorites
		@favorites ||= Favorites.new(@api_request)
	end

	def groups
		@groups ||= Groups.new(@api_request)
	end

	def interestingness
		@interestingness ||= Interestingness.new(@api_request)
	end

	def machinetags
		@machinetags ||= Machinetags.new(@api_request)
	end

	def panda
		@panda ||= Panda.new(@api_request)
	end

	def people
		@people ||= People.new(@api_request)
	end

	def photos
		@photos ||= Photos.new(@api_request)
	end

	def photosets
		@photosets ||= Photosets.new(@api_request)
	end

	def places
		@places ||= Places.new(@api_request)
	end

	def prefs
		@prefs ||= Prefs.new(@api_request)
	end

	def reflection
		@reflection ||= Reflection.new(@api_request)
	end

	def test
		@test ||= ApiTest.new(@api_request)
	end

	def tags
		@tags ||= Tags.new(@api_request)
	end

	def urls
		@urls ||= Urls.new(@api_request)
	end
end