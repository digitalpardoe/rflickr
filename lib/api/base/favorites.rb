require 'core/api_base'

class Favorites < ApiBase
	def add(photo_id)
		method = 'flickr.favorites.add'
		auth = true
		get = false
		args = {'photo_id' => photo_id}

		@api.call(method, args, auth, nil, get)
	end

	def get_list(user_id=nil, min_fave_date=nil, max_fave_date=nil, extras=nil, per_page=nil, page=nil)
		method = 'flickr.favorites.getList'
		auth = true
		get = true
		args = {'user_id' => user_id, 'min_fave_date' => min_fave_date, 'max_fave_date' => max_fave_date, 'extras' => extras, 'per_page' => per_page, 'page' => page}

		@api.call(method, args, auth, nil, get)
	end

	def get_public_list(user_id, min_fave_date=nil, max_fave_date=nil, extras=nil, per_page=nil, page=nil)
		method = 'flickr.favories.getPublicList'
		auth = false
		get = true
		args = {'user_id' => user_id, 'min_fave_date' => min_fave_date, 'max_fave_date' => max_fave_date, 'extras' => extras, 'per_page' => per_page, 'page' => page}

		@api.call(method, args, auth, nil, get)
	end

	def remove(photo_id)
		method = 'flickr.favorites.remove'
		auth = true
		get = false
		args = {'photo_id' => photo_id}

		@api.call(method, args, auth, nil, get)
	end
end