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

class Flickr::Favorites < Flickr::APIBase
	# photo can be either a Photo or numeric id
	def add(photo)
		photo = photo.id if photo.class == Flickr::Photo
		return @flickr.call_method('flickr.favorites.add',
			'photo_id' => photo)
	end

	# photo can be either a Photo or numeric id
	def remove(photo)
		photo = photo.id if photo.class == Flickr::Photo
		return @flickr.call_method('flickr.favorites.remove',
			'photo_id' => photo)
	end

	# This is a little weird because all the parametrs are optional,
	# let's go with it, ok?
	# user can be a Person or a user NSID
	# No caching because it's just too hard.
	def getList(user=nil,extras=nil,per_page=nil,page=nil)
		args = {}

		user = user.nsid if user.class == Flickr::Person
		args['user_id'] = user if user
		args['extras'] = extras.join(',') if extras.class == Array
		args['per_page'] = per_page if per_page
		args['page'] = page if page

		res = @flickr.call_method('flickr.favorites.getList',args)
		att = res.root.attributes
		return Flickr::PhotoList.from_xml(res,@flickr)
	end

	# This is a little weird because all the parametrs are optional,
	# let's go with it, ok?
	# user can be a Person or a user NSID
	# No caching because it's just too hard.
	def getPublicList(user,extras=nil,per_page=nil,page=nil)
		args = {}

		user = user.nsid if user.class == Flickr::Person

		args['user_id'] = user if user
		args['extras'] = extras.join(',') if extras.class == Array
		args['per_page'] = per_page if per_page
		args['page'] = page if page

		res = @flickr.call_method('flickr.favorites.getPublicList',args)
		att = res.root.attributes
		list = Flickr::PhotoList.new(att['page'].to_i,att['pages'].to_i,
			att['perpage'].to_i,att['total'].to_i)
		res.elements['/photos'].each_element do |e|
			list << Flick::Photo.from_xml(e,@flickr)
		end
		return list
	end
end
