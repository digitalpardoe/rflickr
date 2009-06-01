require 'core/interaction/request/rest'
require 'core/interaction/format/json'

module RestJsonApi
	include Rest
	include Json
end
