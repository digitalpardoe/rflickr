require 'flickr/interaction/request'

class Api
	attr_accessor :frob
  
	def initialize(api, parent)
		@api = api
    @parent = parent
	end

	def login_link(perms='read')
		@frob = @parent.flickr_auth_getFrob['frob']['_content']
		args = {'api_key' => @api.tokens.api_key, 'perms' => perms, 'frob' => @frob}
		args = @api.sign_request(args)

		Request.build_url('http://flickr.com/services/auth/', args)
	end

	def get_token(frob=@frob)
		if frob
			@parent.flickr_auth_getToken(args: { frob: frob })
		else
			raise ArgumentError, "missing 'frob' argument, perhaps you need to call 'login_link' first"
		end
	end
end