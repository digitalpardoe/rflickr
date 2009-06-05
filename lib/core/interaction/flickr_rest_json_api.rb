require 'rubygems'
require 'json'
require 'digest'

require 'core/interaction/request/rest'

class FlickrRestJsonApi
	API_RSP = 'json'
	API_REQ = 'rest'
	API_URL = "http://api.flickr.com/services/#{API_REQ}/"

	def self.setup(key, shared_secret, auth_token)
		@@key ||= key
		@@shared_secret ||= shared_secret
		@@auth_token ||= auth_token
	end

	def initialize
		@arguments = { 'format' => API_RSP, 'api_key' => @@key }
	end

	def call(method, arguments, authenticated, get)
		arguments ? @arguments.merge(arguments) : nil

		@arguments = @arguments.merge({'method' => method})
		@arguments = remove_blank_args(@arguments)

		if authenticated
			@arguments = @arguments.merge({'auth_token' => @@auth_token})
			@arguments = sort_arguments(@arguments)

			api_sig = @@shared_secret.to_s
			@arguments.each { |item| api_sig << item[0] + item[1] }
			sig_digest = Digest::MD5.hexdigest(api_sig)

			@arguments.insert(0, ['api_sig', sig_digest])
		end

		JSON.parse strip_function(Rest.make_request(API_URL, @arguments.class == Array ? @arguments : @arguments.to_a, get))
	end

	def remove_blank_args(arguments)
		arguments.delete_if { |key,value| value == nil }
	end

	def sort_arguments(arguments)
		arguments.sort { |a,b| a[0]<=>b[0] }
	end

	def strip_function(json_string)
		json_string.gsub('jsonFlickrApi(', '').gsub(')', '')
	end

	def key()							@@key							end
	def shared_secret()					@@shared_secret					end
	def auth_token()					@@auth_token					end
	
	def key(key)						@@key = key						end
	def shared_secret(shared_secret)	@@shared_secret = shared_secret	end
	def auth_token(auth_token)			@@auth_token = auth_token		end
end
