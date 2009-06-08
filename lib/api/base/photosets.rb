require 'core/api_base'

require 'api/base/photosets/comments'

class Photosets < ApiBase
	def add_photo

	end

	def create

	end

	def delete

	end

	def edit_meta

	end

	def edit_photos

	end

	def get_context

	end

	def get_info

	end

	def get_list

	end

	def get_photos

	end

	def order_sets

	end

	def remove_photo

	end

	# Create nested API objects.

	def comments
		@comments ||= Comments.new(@api)
	end
end