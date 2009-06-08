require 'core/api_base'

require 'api/base/photos/comments'
require 'api/base/photos/geo'
require 'api/base/photos/licenses'
require 'api/base/photos/notes'
require 'api/base/photos/transform'
require 'api/base/photos/upload'

class Photos < ApiBase
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

	# Create nested API objects.

	def comments
		@comments ||= Comments.new(@api)
	end

	def geo
		@geo ||= Geo.new(@api)
	end

	def licenses
		@licenses ||= Licenses.new(@api)
	end

	def notes
		@notes ||= Notes.new(@api)
	end

	def transform
		@transform ||= Transform.new(@api)
	end

	def upload
		@upload ||= Upload.new(@api)
	end
end