require 'core/api_base'

class Collections < ApiBase
	def get_info(collection_id)
		method = 'flickr.collections.getInfo'
		auth = true
		get = true
		args = {'collection_id' => collection_id}

		@api.call(method, args, auth, nil, get)
	end

	def get_tree(collection_id=nil, user_id=nil)
		method = 'flickr.collections.getTree'
		get = true
		auth = user_id ? false : true
		args = {'collection_id' => collection_id, 'user_id' => user_id}

		@api.call(method, args, auth, nil, get)
	end
end