require 'util/api_header'

require 'api/photosets/comments'

class Photosets < RestJsonApi
	include Initialize

	def comments()	@comments	||=	Comments.new(self.token_cache, self.api_key, self.shared_secret)	end

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
end