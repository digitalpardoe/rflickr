require 'core/api_base'

# This class has a slightly different naming convention to other
# classes to prevent conflicts with the core Ruby libraries.

class ApiTest < ApiBase
	def echo
		method_name = 'flickr.test.echo'
		authenticated = false
		
		@api.call(method_name, nil, authenticated)
	end

	def login

	end

	def null

	end
end