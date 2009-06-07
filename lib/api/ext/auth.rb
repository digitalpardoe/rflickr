require 'api/base/auth'

require 'core/interaction/request'

class AuthExt < Auth
	def login_link(perms='read')
		args = {'api_key' => @tokens.api_key, 'perms' => perms, 'frob' => get_frob['frob']['_content']}
		args = @api.sign_request(args)

		Request.build_url('http://flickr.com/services/auth/', args)
	end
end