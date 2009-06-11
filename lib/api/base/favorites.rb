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
		args = {'user_id' => user_id, 'min_fave_date' => min_fave_date, 'max_fave_date' => max_fave_date, 'per_page' => per_page, 'page' => page}

		extras_accepted_values = [ 'license', 'date_upload', 'date_taken', 'owner_name', 'icon_server', 'original_format', 'last_update', 'geo', 'tags', 'machine_tags', 'o_dims', 'views', 'media' ]
		valid_extras = extras ? extras_accepted_values.include?(extras) : true

		if valid_extras == false
			raise ArgumentError, "invalid extras value, must be one of - #{extras_accepted_values.join(', ')}"
		else
			args = args.merge({'extras' => extras})
		end

		@api.call(method, args, auth, nil, get)
	end

	def get_public_list(user_id, min_fave_date=nil, max_fave_date=nil, extras=nil, per_page=nil, page=nil)
		method = 'flickr.favories.getPublicList'
		auth = false
		get = true
		args = {'user_id' => user_id, 'min_fave_date' => min_fave_date, 'max_fave_date' => max_fave_date, 'per_page' => per_page, 'page' => page}

		extras_accepted_values = [ 'license', 'date_upload', 'date_taken', 'owner_name', 'icon_server', 'original_format', 'last_update', 'geo', 'tags', 'machine_tags', 'o_dims', 'views', 'media' ]
		valid_extras = extras ? extras_accepted_values.include?(extras) : true

		if valid_extras == false
			raise ArgumentError, "invalid extras value, must be one of - #{extras_accepted_values.join(', ')}"
		else
			args = args.merge({'extras' => extras})
		end

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