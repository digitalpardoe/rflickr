require 'core/api_base'

class Contacts < ApiBase
	def get_list(filter=nil, page=nil, per_page=nil)
		method = 'flickr.contacts.getList'
		auth = true
		get = true
		args = {'page' => page, 'per_page' => per_page}

		filter_accepted_values = [ 'friends', 'family', 'both', 'neither' ]
		valid_filter = filter ? filter_accepted_values.include?(filter) : true

		if valid_filter == false
			raise ArgumentError, "invalid filter value, must be one of - #{filter_accepted_values.join(', ')}"
		else
			args = args.merge({'filter' => filter})
		end

		@api.call(method, args, auth, nil, get)
	end

	def get_list_recently_uploaded(date_lastupload=nil, filter=nil)
		method = 'flickr.contacts.getListRecentlyUploaded'
		auth = true
		get = true
		args = {'date_lastupload' => date_lastupload}

		filter_accepted_values = [ 'ff', 'all' ]
		valid_filter = filter ? filter_accepted_values.include?(filter) : true

		if valid_filter == false
			raise ArgumentError, "invalid filter value, must be one of - #{filter_accepted_values.join(', ')}"
		else
			args = args.merge({'filter' => filter})
		end

		@api.call(method, args, auth, nil, get)
	end

	def get_public_list(user_id, page=nil, per_page=nil)
		method = 'flickr.contacts.getPublicList'
		auth = false
		get = true
		args = {'user_id' => user_id, 'page' => page, 'per_page' => per_page}

		@api.call(method, args, auth, nil, get)
	end
end