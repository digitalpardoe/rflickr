require 'core/api_base'
require 'core/interaction/request'

class AuthExt < ApiBase
	attr_accessor :frob

	def login_link(perms='read')
		@frob = @super.flickr_auth_getFrob['frob']['_content']
		args = {'api_key' => @tokens.api_key, 'perms' => perms, 'frob' => @frob}
		args = @api.sign_request(args)

		Request.build_url('http://flickr.com/services/auth/', args)
	end

	def get_token(frob=@frob)
		if frob
			@super.flickr_auth_getToken(args: { frob: frob })
		else
			raise ArgumentError, "missing 'frob' argument, perhaps you need to call 'login_link' first"
		end
	end
end