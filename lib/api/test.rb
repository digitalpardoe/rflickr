require 'core/api_base'

# This class has a slightly different naming convention to other
# classes to prevent conflicts with the core Ruby libraries.

class ApiTest < ApiBase
	def echo
		method = 'flickr.test.echo'
		auth = false
		
		@api.call(method, nil, auth)
	end

	def login
		method = 'flickr.test.login'
		auth = true

		@api.call(method, nil, auth)
	end

	def null

	end
end