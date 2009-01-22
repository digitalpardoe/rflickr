# rFlickr: A Ruby based Flickr API implementation.
# Copyright (C) 2009, Alex Pardoe (digital:pardoe)
#
# Derrived from work by Trevor Schroeder, see here:
# http://rubyforge.org/projects/rflickr/.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'flickr/base'

class Flickr::Blogs < Flickr::APIBase

	def getList()
		return @flickr.blog_cache_lookup if @flickr.blog_cache_lookup
		res = @flickr.call_method('flickr.blogs.getList')
		list = []
		res.elements['/blogs'].each_element do |e|
			att = e.attributes
			list << Flickr::Blog.new(att['id'], att['name'],
				att['needspassword'].to_i == 1, att['url'])
		end
		@flickr.blog_cache_store(list)
		return list
	end

	# blog can be either an integer blog ID or a Blog object
	# photo can be either an integer photo ID or a Photo object
	def postPhoto(blog, photo, title, description, blog_password=nil)
		blog = blog.id if blog.class == Flickr::Blog
		photo = photo.id if photo.class == Flickr::Photo

		args={'blog'=>blog,'photo'=>photo,'title'=>title,
			description=>'description'}
		args['blogs_password'] = blog_password if blog_password

		@flickr.call_method('flickr.blogs.postPhoto',args)
	end
end
