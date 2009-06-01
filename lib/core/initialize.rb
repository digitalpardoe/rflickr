module Initialize
	def initialize(*params)
		if (params.size != 3 && params.size != 0)
			raise ArgumentError, 'wrong number of arguments (' + params.size.to_s + ' for 3)'
		end

		@@token_cache ||= params[0]
		@@api_key ||= params[1]
		@@api_key ||= params[2]
	end

	def token_cache
		@@token_cache
	end

	def api_key
		@@api_key
	end

	def shared_secret
		@@shared_secret
	end
end
