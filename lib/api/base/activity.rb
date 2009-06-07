require 'core/api_base'

class Activity < ApiBase
	def user_comments(per_page, page=nil)
		method = 'flickr.activity.userComments'
		auth = true
		get = true
		args = {'per_page' => per_page, 'page' => page}

		@api.call(method, args, auth, nil, get)
	end

	def user_photos(timeframe=nil, per_page=nil, page=nil)
		method = 'flickr.activity.userPhotos'
		auth = true
		get = true
		args = {'timeframe' => timeframe, 'per_page' => per_page, 'page' => page}

		@api.call(method, args, auth, nil, get)
	end
end