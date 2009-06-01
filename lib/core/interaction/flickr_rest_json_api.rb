require 'json'
require 'digest'

require 'core/interaction/request/rest'

class FlickrRestJsonApi
	include Rest

	attr_accessor :arguments

	API_RSP = 'json'
	API_REQ = 'rest'
	API_URL = "http://api.flickr.com/services/#{API_REQ}/"

	def self.setup(key, shared_secret, auth_token)
		@@key ||= key
		@@shared_secret ||= shared_secret
		@@auth_token ||= auth_token
	end

	def initialize
		@arguments = {'format' => API_RSP, 'api_key' => @@key }
	end

	def call(method, arguments, authenticated)
		if (arguments != nil)
			@arguments.merge(arguments)
		end

		@arguments = @arguments.merge({'method' => method})

		@arguments = remove_blank_args(@arguments)

		if (authenticated)
			@arguments = @arguments.merge({'auth_token' => @@auth_token})
			@arguments = sort_arguments(@arguments)

			to_hash = @@shared_secret.to_s
			@arguments.length.times do |i|
				to_hash << @arguments[i][0] + @arguments[i][1]

			end

			digest = Digest::MD5.hexdigest(to_hash)

			hash = {}
			@arguments.each do |entry|
				hash[entry[0]] = entry[1]
			end
			@arguments = hash

			@arguments = @arguments.merge({'api_sig' => digest})
		end

		JSON.parse strip_function(make_request(API_URL, @arguments.to_a))
	end

	def strip_function(json_string)
		json_string.gsub('jsonFlickrApi(', '').gsub(')', '')
	end

	def sort_arguments(arguments)
		arguments.sort{ |a,b| a[0]<=>b[0] }
	end

	def remove_blank_args(arguments)
		arguments.delete_if { |key,value| value == nil }
	end

	def key
		@@key
	end

	def shared_secret
		@@shared_secret
	end

	def auth_token
		@@auth_token
	end
end
