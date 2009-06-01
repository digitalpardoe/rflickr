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

require 'core/initialize'

class Flickr
	include Initialize

	# Create instances of all the other classes to allow us to simulate
	# the Flickr API 'flickr.class.method' convention.

	def activity()			@activity		||=	Activity.new(self.token_cache, self.api_key, self.shared_secret)		end
	def auth()				@auth			||=	Auth.new(self.token_cache, self.api_key, self.shared_secret)			end
	def blogs()				@blogs			||=	Blogs.new(self.token_cache, self.api_key, self.shared_secret)			end
	def collections()		@collections	||=	Collections.new(self.token_cache, self.api_key, self.shared_secret)		end
	def commons()			@commons		||=	Commons.new(self.token_cache, self.api_key, self.shared_secret)			end
	def contacts()			@contacts		||=	Contacts.new(self.token_cache, self.api_key, self.shared_secret)		end
	def favorites()			@favorites		||=	Favorites.new(self.token_cache, self.api_key, self.shared_secret)		end
	def groups()			@groups			||=	Groups.new(self.token_cache, self.api_key, self.shared_secret)			end
	def interestingness()	@interestingness||=	Interestingness.new(self.token_cache, self.api_key, self.shared_secret)	end
	def machinetags()		@machinetags	||=	Machinetags.new(self.token_cache, self.api_key, self.shared_secret)		end
	def panda()				@panda			||=	Panda.new(self.token_cache, self.api_key, self.shared_secret)			end
	def people()			@people			||=	People.new(self.token_cache, self.api_key, self.shared_secret)			end
	def photos()			@photos			||=	Photos.new(self.token_cache, self.api_key, self.shared_secret)			end
	def photosets()			@photosets		||=	Photosets.new(self.token_cache, self.api_key, self.shared_secret)		end
	def places()			@places			||=	Places.new(self.token_cache, self.api_key, self.shared_secret)			end
	def prefs()				@prefs			||=	Prefs.new(self.token_cache, self.api_key, self.shared_secret)			end
	def reflection()		@reflection		||=	Reflection.new(self.token_cache, self.api_key, self.shared_secret)		end
	def test()				@test			||= ApiTest.new(self.token_cache, self.api_key, self.shared_secret)			end
	def tags()				@tags			||=	Tags.new(self.token_cache, self.api_key, self.shared_secret)			end
	def urls()				@urls			||=	Urls.new(self.token_cache, self.api_key, self.shared_secret)			end
end