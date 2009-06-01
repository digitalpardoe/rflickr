require 'util/api_header'

# This class has a slightly different naming convention to other
# classes to prevent conflicts with the core Ruby libraries.

class ApiTest < Initialize
	include RestJsonApi

	def echo

	end

	def login

	end

	def null

	end
end