module Initialize
	attr_accessor :token_cache, :api_key, :shared_secret

	def initialize(token_cache, api_key, shared_secret)
		@token_cache = token_cache
		@api_key = api_key
		@shared_secret = shared_secret
	end
end
