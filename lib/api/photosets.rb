require 'api/photosets/comments'

class Photosets
	def initialize

	end

	def comments()	@comments	||=	Comments.new	end
end