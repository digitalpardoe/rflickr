require 'json'

require 'core/interaction/request/rest'

class FlickrRestJsonApi
	include Rest

	attr_accessor :arguments

	API_RSP = 'json'
	API_REQ = 'rest'
	API_URL = "http://api.flickr.com/services/#{API_REQ}/"

	def initialize
		@arguments = {'format' => API_RSP }
	end

	def call(method, arguments, authenticated)
		if (arguments != nil)
			@arguments.merge(arguments)
		end

		puts arguments

#		JSON.parse strip_function(make_request(API_URL, remove_blank_args(@arguments.merge({'method' => method})), authenticated))
	end

	

	def strip_function(json_string)
		json_string.gsub('jsonFlickrApi(', '').gsub(')', '')
	end
end
