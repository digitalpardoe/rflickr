require 'util/api_header'

require 'api/photos/comments'
require 'api/photos/geo'
require 'api/photos/licenses'
require 'api/photos/notes'
require 'api/photos/transform'
require 'api/photos/upload'

class Photos < RestJsonApi
	include Initialize

	def comments()	@comments	||=	Comments.new	end
	def geo()		@geo		||=	Geo.new			end
	def licenses()	@licenses	||=	Licenses.new	end
	def notes()		@notes		||=	Notes.new		end
	def transform()	@transform	||=	Transform.new	end
	def upload()	@upload		||=	Upload.new		end

	def add_tags

	end

	def delete

	end

	def get_all_contexts

	end

	def get_contacts_photos

	end

	def get_contacts_public_photos

	end

	def get_context

	end

	def get_counts

	end

	def get_exif

	end

	def get_favorites

	end

	def get_info

	end

	def get_not_in_set

	end

	def get_perms

	end

	def get_recent

	end

	def get_sizes

	end

	def get_untagged

	end

	def get_with_geo_data

	end

	def get_without_geo_data

	end

	def recently_updated

	end

	def remove_tag

	end

	def search

	end

	def set_content_type

	end

	def set_dates

	end

	def set_meta

	end

	def set_perms

	end

	def set_safety_level

	end

	def set_tags

	end
end