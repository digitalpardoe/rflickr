require 'rubygems'
require 'json'
require 'digest'

require 'core/interaction/request'

class FlickrApiRequest
	API_RSP = 'json'
	API_REQ = 'rest'
	API_URL = "http://api.flickr.com/services/#{API_REQ}/"

	def initialize(tokens)
		@tokens = tokens
		@arguments = { 'format' => API_RSP, 'api_key' => @tokens.api_key }
	end

	def call(method, arguments, authenticated, signed, get)
		arguments ? arguments = arguments.merge(@arguments) : arguments = @arguments

		arguments = arguments.merge({'method' => method})
		arguments = remove_blank_args(arguments)

		if authenticated
			if !@tokens.auth_token
				return {'stat' => 'fail'}
			end

			arguments = arguments.merge({'auth_token' => @tokens.auth_token})

			arguments = sign_request(arguments)
		elsif signed
			arguments = sign_request(arguments)
		end

		JSON.parse strip_function(Request.make(API_URL, arguments.class == Array ? arguments : arguments.to_a, get))
	end

	def sign_request(arguments)
		arguments = sort_arguments(arguments)

		api_sig = @tokens.shared_secret.clone
		arguments.each { |item| api_sig << item[0] + item[1] }
		sig_digest = Digest::MD5.hexdigest(api_sig)

		arguments.insert(0, ['api_sig', sig_digest])

		arguments
	end

	private
	def remove_blank_args(arguments)
		arguments.delete_if { |key,value| value == nil }
	end

	def sort_arguments(arguments)
		arguments.sort { |a,b| a[0]<=>b[0] }
	end

	def strip_function(json_string)
		json_string.gsub('jsonFlickrApi(', '').gsub(')', '')
	end
end
