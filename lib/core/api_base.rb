require 'core/interaction/flickr_api_request'

class ApiBase
	def initialize(tokens)
		@tokens = tokens
		@api ||= FlickrApiRequest.new(@tokens)
	end
end
