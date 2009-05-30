require 'api/photos/comments'
require 'api/photos/geo'
require 'api/photos/licenses'
require 'api/photos/notes'
require 'api/photos/transform'
require 'api/photos/upload'

class Photos
	def initialize

	end

	def comments()	@comments	||=	Comments.new	end
	def geo()		@geo		||=	Geo.new			end
	def licenses()	@licenses	||=	Licenses.new	end
	def notes()		@notes		||=	Notes.new		end
	def transform()	@transform	||=	Transform.new	end
	def upload()	@upload		||=	Upload.new		end
end