require 'core/api_base'

require 'api/base/groups/members'
require 'api/base/groups/pools'

class Groups < ApiBase
	def browse

	end

	def get_info

	end

	def search

	end

	# Create nested API objects.

	def members
		@members ||= Members.new(@api)
	end

	def pools
		@pools ||= Pools.new(@api)
	end
end