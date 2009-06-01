require 'util/api_header'

require 'api/groups/members'
require 'api/groups/pools'

class Groups < RestJsonApi
	include Initialize

	def members()	@members		||=	Members.new	end
	def pools()		@pools			||=	Pools.new	end

	def browse

	end

	def get_info

	end

	def search

	end
end