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
	end

	def auth_token(auth_token)
		@tokens.auth_token = auth_token
		self
	end

	class Tokens
		attr_accessor :api_key, :shared_secret, :auth_token

		def initialize(api_key, shared_secret, auth_token)
			@api_key = api_key
			@shared_secret = shared_secret
			@auth_token = auth_token
		end
	end

	# Create instances of all the other classes to allow us to simulate
	# the Flickr API 'flickr.class.method' convention.

	def activity()			@activity		||=	Activity.new(@tokens)										end
	def auth()				@auth			||=	@extended_api ?  AuthExt.new(@tokens) : Auth.new(@tokens)	end
	def blogs()				@blogs			||=	Blogs.new(@tokens)											end
	def collections()		@collections	||=	Collections.new(@tokens)									end
	def commons()			@commons		||=	Commons.new(@tokens)										end
	def contacts()			@contacts		||=	Contacts.new(@tokens)										end
	def favorites()			@favorites		||=	Favorites.new(@tokens)										end
	def groups()			@groups			||=	Groups.new(@tokens)											end
	def interestingness()	@interestingness||=	Interestingness.new(@tokens)								end
	def machinetags()		@machinetags	||=	Machinetags.new(@tokens)									end
	def panda()				@panda			||=	Panda.new(@tokens)											end
	def people()			@people			||=	People.new(@tokens)											end
	def photos()			@photos			||=	Photos.new(@tokens)											end
	def photosets()			@photosets		||=	Photosets.new(@tokens)										end
	def places()			@places			||=	Places.new(@tokens)											end
	def prefs()				@prefs			||=	Prefs.new(@tokens)											end
	def reflection()		@reflection		||=	Reflection.new(@tokens)										end
	def test()				@test			||= ApiTest.new(@tokens)										end
	def tags()				@tags			||=	Tags.new(@tokens)											end
	def urls()				@urls			||=	Urls.new(@tokens)											end
end