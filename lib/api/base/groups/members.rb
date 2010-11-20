require 'core/api_base'

class Members < ApiBase
  def get_list(group_id, membertypes=nil, per_page=nil, page=nil)
    method = 'flickr.groups.members.getList'
		auth = true
		get = true
		args = {'group_id' => group_id, 'page' => page, 'per_page' => per_page}

		membertypes_accepted_values = [ 2, 3, 4 ]
		valid_membertypes = false
		
		if membertypes
	    membertypes.each do |type|
        if membertypes_accepted_values.include?(type)
          valid_membertypes = true
        else
          valid_membertypes = false
          break
        end
      end
	  else
	    valid_membertypes = true
    end
    
		if valid_membertypes == false
			raise ArgumentError, "invalid member types value, must be one of - #{membertypes_accepted_values.join(', ')}"
		else
			args = args.merge({'membertypes' => membertypes.join(',')}) unless !membertypes
		end
		
		@api.call(method, args, auth, nil, get)
	end
end