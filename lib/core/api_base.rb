require 'core/interaction/flickr_rest_json_api'

class ApiBase
	attr_accessor :api

	def self.setup(api_key, shared_secret, auth_token)
		@@api_key ||= api_key
		@@shared_secret ||= shared_secret
		@@auth_token ||= auth_token
	end

	def initialize
		@api = FlickrRestJsonApi.new
	end

	def api_key
		@@api_key
	end

	def shared_secret
		@@shared_secret
	end

	def auth_token
		@@auth_token
	end

	def call(method, arguments, authenticated)
		remove_blank_args(arguments).merge({'api_key' => @@api_key})

		if (authenticated)
			arguments.merge({'auth_token' => @@auth_token})
			arguments = sort_arguments(arguments)

			to_hash = @@shared_secret.to_s
			arguments.each_pair { |key,value| to_hash << key.to_s + value.to_s }

			digest = Digest::MD5.hexdigest(to_hash)
			arguments.merge({'api_sig' => digest})
		end

		@api.call(method, arguments, authenticated)
	end

	def sort_arguments(arguments)
		arguments.sort{ |a,b| a[0]<=>b[0] }
	end
	
	def remove_blank_args(arguments)
		arguments.delete_if { |key,value| value == nil }
	end

end
