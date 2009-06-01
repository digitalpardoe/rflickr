require 'core/interaction/flickr_rest_json_api'

class ApiBase
	attr_accessor :api

	def self.setup(token_cache, api_key, shared_secret)
		@@token_cache ||= token_cache
		@@api_key ||= api_key
		@@shared_secret ||= shared_secret
	end

	def initialize
		@api = FlickrRestJsonApi.new
	end

	def token_cache
		@@token_cache
	end

	def api_key
		@@api_key
	end

	def shared_secret
		@@shared_secret
	end
end
