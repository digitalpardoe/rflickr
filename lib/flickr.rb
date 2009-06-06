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
		FlickrApiRequest.setup(api_key, shared_secret, args ? args[:auth_token] : nil)
		@extended_api = args ? args[:extended] || false : false
	end

	def auth_token(auth_token)
		FlickrApiRequest.auth_token(auth_token)
		self
	end

	# Create instances of all the other classes to allow us to simulate
	# the Flickr API 'flickr.class.method' convention.

	def activity()			@activity		||=	Activity.new							end
	def auth()				@auth			||=	@extended_api ?  AuthExt.new : Auth.new	end
	def blogs()				@blogs			||=	Blogs.new								end
	def collections()		@collections	||=	Collections.new							end
	def commons()			@commons		||=	Commons.new								end
	def contacts()			@contacts		||=	Contacts.new							end
	def favorites()			@favorites		||=	Favorites.new							end
	def groups()			@groups			||=	Groups.new								end
	def interestingness()	@interestingness||=	Interestingness.new						end
	def machinetags()		@machinetags	||=	Machinetags.new							end
	def panda()				@panda			||=	Panda.new								end
	def people()			@people			||=	People.new								end
	def photos()			@photos			||=	Photos.new								end
	def photosets()			@photosets		||=	Photosets.new							end
	def places()			@places			||=	Places.new								end
	def prefs()				@prefs			||=	Prefs.new								end
	def reflection()		@reflection		||=	Reflection.new							end
	def test()				@test			||= ApiTest.new								end
	def tags()				@tags			||=	Tags.new								end
	def urls()				@urls			||=	Urls.new								end
end