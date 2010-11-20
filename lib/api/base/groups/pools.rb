require 'core/api_base'

class Pools < ApiBase
	def add(photo_id, group_id)
    method = 'flickr.groups.pools.add'
		auth = true
		get = false
		args = {'photo_id' => photo_id, 'group_id' => group_id}

		@api.call(method, args, auth, nil, get)
	end

	def get_context(photo_id, group_id)
    method = 'flickr.groups.pools.getContext'
		auth = false
		get = true
		args = {'photo_id' => photo_id, 'group_id' => group_id}

		@api.call(method, args, auth, nil, get)
	end

	def get_groups(page=nil, per_page=nil)
    method = 'flickr.groups.pools.getGroups'
		auth = true
		get = true
		args = {'page' => page, 'per_page' => per_page}

		@api.call(method, args, auth, nil, get)
	end

	def get_photos(group_id, tags=nil, user_id=nil, extras=nil, per_page=nil, page=nil)
    method = 'flickr.groups.pools.getPhotos'
		auth = false
		get = true
		args = {'group_id' => group_id, 'tags' => tags, 'user_id' => user_id, 'extras' => extras, 'per_page' => per_page, 'page' => page}

		@api.call(method, args, auth, nil, get)
	end

	def remove(photo_id, group_id)
    method = 'flickr.groups.pools.remove'
		auth = true
		get = false
		args = {'photo_id' => photo_id, 'group_id' => group_id}

		@api.call(method, args, auth, nil, get)
	end
end