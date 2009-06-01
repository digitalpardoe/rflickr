require 'core/interaction/request/rest'
require 'core/interaction/format/json'

class FlickrRestJsonApi
	include Rest
	include Json

	attr_accessor :arguments

	API_RSP = 'json'
	API_REQ = 'rest'
	API_URL = "http://api.flickr.com/services/#{API_REQ}/"

	def initialize
		@arguments = Hash[:format, API_RSP]
	end
end
