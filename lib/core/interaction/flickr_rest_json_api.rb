require 'json'

require 'core/interaction/request/rest'

class FlickrRestJsonApi
	include Rest

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

		JSON.parse make_request(API_URL, remove_blank_args(@arguments.merge({'method' => method})), authenticated).gsub('jsonFlickrApi(', '').gsub(')', '')
	end

	def remove_blank_args(arguments)
		arguments.delete_if { |key,value| value == nil }
	end
end
