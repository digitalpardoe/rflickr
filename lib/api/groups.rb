require 'util/api_header'

require 'api/groups/members'
require 'api/groups/pools'

class Groups < RestJsonApi
	include Initialize

	def members()	@members		||=	Members.new(self.token_cache, self.api_key, self.shared_secret)	end
	def pools()		@pools			||=	Pools.new(self.token_cache, self.api_key, self.shared_secret)	end

	def browse

	end

	def get_info

	end

	def search

	end
end