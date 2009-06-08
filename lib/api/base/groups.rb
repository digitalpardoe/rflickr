require 'core/api_base'

require 'api/base/groups/members'
require 'api/base/groups/pools'

class Groups < ApiBase
	def members()	@members		||=	Members.new(@api)	end
	def pools()		@pools			||=	Pools.new(@api)		end

	def browse

	end

	def get_info

	end

	def search

	end
end