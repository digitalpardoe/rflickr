require 'core/interaction/flickr_api_request'

class ApiBase
	def initialize
		@@api ||= FlickrApiRequest.new
	end
end
