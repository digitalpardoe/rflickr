require 'core/api_base'

# This class has a slightly different naming convention to other
# classes to prevent conflicts with the core Ruby libraries.

class ApiTest < ApiBase
	def echo
		method = 'flickr.test.echo'
		auth = false
		get = true
		
		@api.call(method, nil, auth, nil, get)
	end

	def login
		method = 'flickr.test.login'
		auth = true
		get = true

		@api.call(method, nil, auth, nil, get)
	end

	def null
		method = 'flickr.test.null'
		auth = true
		get = true

		@api.call(method, nil, auth, nil, get)
	end
end