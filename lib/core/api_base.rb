require 'core/interaction/flickr_rest_json_api'

class ApiBase
	attr_accessor :api

	def self.setup(api_key, shared_secret, auth_token)
		FlickrRestJsonApi.setup(api_key, shared_secret, auth_token)
	end

	def initialize
		@api = FlickrRestJsonApi.new
	end
end
