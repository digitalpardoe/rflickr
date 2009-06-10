require 'core/api_base'

class Commons < ApiBase
	def get_institutions
		method = 'flickr.commons.getInstitutions'
		auth = false
		get = true

		@api.call(method, nil, auth, nil, get)
	end
end