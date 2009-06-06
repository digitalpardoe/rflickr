require 'api/activity'
require 'api/auth'
require 'api/blogs'
require 'api/collections'
require 'api/commons'
require 'api/contacts'
require 'api/favorites'
require 'api/groups'
require 'api/interestingness'
require 'api/machinetags'
require 'api/panda'
require 'api/people'
require 'api/photos'
require 'api/photosets'
require 'api/places'
require 'api/prefs'
require 'api/reflection'
require 'api/tags'
require 'api/test'
require 'api/urls'

require 'core/interaction/flickr_api_request'

class Flickr
	def initialize(api_key, shared_secret, auth_token)
		FlickrApiRequest.setup(api_key, shared_secret, auth_token)
	end

	def auth_token(auth_token)
		FlickrApiRequest.auth_token(auth_token)
		self
	end

	# Create instances of all the other classes to allow us to simulate
	# the Flickr API 'flickr.class.method' convention.

	def activity()			@activity		||=	Activity.new		end
	def auth()				@auth			||=	Auth.new			end
	def blogs()				@blogs			||=	Blogs.new			end
	def collections()		@collections	||=	Collections.new		end
	def commons()			@commons		||=	Commons.new			end
	def contacts()			@contacts		||=	Contacts.new		end
	def favorites()			@favorites		||=	Favorites.new		end
	def groups()			@groups			||=	Groups.new			end
	def interestingness()	@interestingness||=	Interestingness.new	end
	def machinetags()		@machinetags	||=	Machinetags.new		end
	def panda()				@panda			||=	Panda.new			end
	def people()			@people			||=	People.new			end
	def photos()			@photos			||=	Photos.new			end
	def photosets()			@photosets		||=	Photosets.new		end
	def places()			@places			||=	Places.new			end
	def prefs()				@prefs			||=	Prefs.new			end
	def reflection()		@reflection		||=	Reflection.new		end
	def test()				@test			||= ApiTest.new			end
	def tags()				@tags			||=	Tags.new			end
	def urls()				@urls			||=	Urls.new			end
end