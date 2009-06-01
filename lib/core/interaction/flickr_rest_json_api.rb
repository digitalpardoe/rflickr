require 'core/interaction/request/rest'
require 'core/interaction/format/json'

class FlickrRestJsonApi
	include Rest
	include Json

	attr_accessor :arguments

	API_RSP = 'json'
	API_REQ = 'rest'
	API_URL = "http://api.flickr.com/services/#{API_REQ}/"

	def initialize(api_key)
		@arguments = {'format' => API_RSP, 'api_key'=> api_key}
	end

	def call(method, arguments, authenticated)
		if (arguments != nil)
			@arguments.merge(arguments)
		end

		make_request(API_URL, @arguments.merge({'method' => method}), authenticated)
	end
end
