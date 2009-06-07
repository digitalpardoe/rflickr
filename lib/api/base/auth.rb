require 'core/api_base'

class Auth < ApiBase
	def check_token
		method = 'flickr.auth.checkToken'
		auth = true
		get = true

		@api.call(method, nil, auth, nil, get)
	end

	def get_frob
		method = 'flickr.auth.getFrob'
		auth = false
		sign = true
		get = true

		@api.call(method, nil, auth, sign, get)
	end

	def get_full_token(mini_token)
		method = 'flickr.auth.getFullToken'
		auth = false
		sign = true
		get = true
		args = {'mini_token' => mini_token}

		@api.call(method, args, auth, sign, get)
	end

	def get_token(frob)
		method = 'flickr.auth.getToken'
		auth = false
		sign = true
		get = true
		args = {'frob' => frob}

		@api.call(method, args, auth, sign, get)
	end
end