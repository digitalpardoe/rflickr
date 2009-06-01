require 'core/interaction/request/rest'
require 'core/interaction/format/json'

class RestJsonApi
	include Rest
	include Json
end
