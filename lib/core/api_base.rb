class ApiBase
	def initialize(api, parent)
		@api = api
		@tokens = api.tokens
    @super = parent
	end
end
