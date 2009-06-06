require 'core/api_base'

require 'api/base/groups/members'
require 'api/base/groups/pools'

class Groups < ApiBase
	def members()	@members		||=	Members.new(@tokens)	end
	def pools()		@pools			||=	Pools.new(@tokens)		end

	def browse

	end

	def get_info

	end

	def search

	end
end