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
		begin
			@@token_cache
		rescue NameError
			nil
		end
	end

	def api_key
		begin
			@@api_key
		rescue NameError
			nil
		end
	end

	def shared_secret
		begin
			@@shared_secret
		rescue NameError
			nil
		end
	end
end
