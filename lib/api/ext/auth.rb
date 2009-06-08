require 'api/base/auth'

require 'core/interaction/request'

class AuthExt < Auth
	attr_accessor :frob

	def login_link(perms='read')
		@frob = get_frob['frob']['_content']
		args = {'api_key' => @tokens.api_key, 'perms' => perms, 'frob' => @frob}
		args = @api.sign_request(args)

		Request.build_url('http://flickr.com/services/auth/', args)
	end

	def get_token(frob=@frob)
		if frob
			super(frob)
		elsif
			raise "You need call run login_link first if you want to call this method without arguments"
		end
	end
end