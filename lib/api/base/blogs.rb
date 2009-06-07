require 'core/api_base'

class Blogs < ApiBase
	def get_list
		method = 'flickr.blogs.getList'
		auth = true
		get = true

		@api.call(method, nil, auth, nil, get)
	end

	def post_photo(blog_id, photo_id, title, description, blog_password=nil)
		method = 'flickr.blogs.postPhoto'
		auth = true
		get = false
		args = {'blog_id' => blog_id, 'photo_id' => photo_id, 'title' => title, 'description' => description, 'blog_password' => blog_password}

		@api.call(method, args, auth, nil, get)
	end
end