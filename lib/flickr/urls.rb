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

class Flickr::Urls < Flickr::APIBase
	def getGroup(group)
		group = group.nsid if group.class == Flickr::Group
		res = @flickr.call_method('flickr.urls.getGroup',
			'group_id' => group)
		return res.elements['/group'].attributes['url']
	end

	def getUserPhotos(user)
		user = user.nsid if user.respond_to?(:nsid)
		args = {}
		args['user_id'] = user if user
		res = @flickr.call_method('flickr.urls.getUserPhotos',args)
		return res.elements['/user'].attributes['url']
	end

	def getUserProfile(user)
		user = user.nsid if user.respond_to?(:nsid)
		args = {}
		args['user_id'] = user if user
		res = @flickr.call_method('flickr.urls.getUserProfile',args)
		return res.elements['/user'].attributes['url']
	end

	def lookupGroup(url)
		res = @flickr.call_method('flickr.urls.lookupGroup','url'=>url)
		els = res.elements
		nsid = els['/group'].attributes['id']

		g = @flickr.group_cache_lookup(nsid) ||
		  Flickr::Group.new(@flickr,nsid,
			els['/group/groupname'].text)
		@flickr.group_cache_store(g)
		return g
	end

	def lookupUser(url)
		res = @flickr.call_method('flickr.urls.lookupUser','url'=>url)
		els = res.elements
		nsid = els['/user'].attributes['id']
		p = @flickr.person_cache_lookup(nsid) ||
		  Flickr::Person.new(@flickr,nsid,
			els['/user/username'].text)
		@flickr.person_cache_store(p)
		return p
	end
end
