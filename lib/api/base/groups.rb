require 'core/api_base'

require 'api/base/groups/members'
require 'api/base/groups/pools'

class Groups < ApiBase
	def browse(cat_id=nil)
    method = 'flickr.groups.browse'
		auth = true
		get = true
		args = {'cat_id' => cat_id}

		@api.call(method, args, auth, nil, get)
	end

	def get_info(group_id, lang=nil)
    method = 'flickr.groups.getInfo'
		auth = true
		get = true
		args = {'group_id' => group_id, 'lang' => lang}

		@api.call(method, args, auth, nil, get)
	end

	def search(text, per_page=nil, page=nil)
    method = 'flickr.groups.search'
		auth = true
		get = true
		args = {'text' => text, 'per_page' => per_page, 'page' => page}

		@api.call(method, args, auth, nil, get)
	end

	# Create nested API objects.

	def members
		@members ||= Members.new(@api)
	end

	def pools
		@pools ||= Pools.new(@api)
	end
end