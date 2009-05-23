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

class Flickr::Tags < Flickr::APIBase
	def getListPhoto(photo)
		photo = photo.id if photo.class == Flickr::Photo
		res = @flickr.call_method('flickr.tags.getListPhoto',
			'photo_id'=>photo)
		xml = res.root
		phid = xml.attributes['id']
		photo = (photo.class == Flickr::Photo) ? photo :
		  (@flickr.photo_cache_lookup(phid) ||
			  Flickr::Photo.new(@flickr,phid))
		if xml.elements['tags']
			tags = []
			xml.elements['tags'].each_element do |el|
				tags << Flickr::Tag.from_xml(el,photo)
			end
		end
		photo.tags = tags
		return tags
	end

	def getListUserPopular(user,count = nil)
		user = user.nsid if user.class == Flickr::Person
		args = { 'user_id' => user }
		args['count'] = count if count

		res = @flickr.call_method('flickr.tags.getListUserPopular',args)
		tags = {}
		res.elements['/who/tags'].each_element do |tag|
			att = tag.attributes
			tags[tag.text]=att['count'].to_i
		end
		return tags
	end

	def getListUser(user)
		user = user.nsid if user.class == Flickr::Person
		args = { 'user_id' => user }

		res = @flickr.call_method('flickr.tags.getListUser',args)
		tags = []
		res.elements['/who/tags'].each_element do |tag|
			tags << tag.text
		end
		return tags
	end

	def getRelated(tag)
		args = { 'tag' => tag }

		res = @flickr.call_method('flickr.tags.getRelated',args)
		tags = []
		res.elements['/tags'].each_element do |tag|
			tags << tag.text
		end
		return tags
	end
end
