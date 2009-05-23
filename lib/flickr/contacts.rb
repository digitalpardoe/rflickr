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

class Flickr::Contacts < Flickr::APIBase
	def getList(filter=nil)
		res = filter ?
		  @flickr.call_method('flickr.contacts.getList') :
		  @flickr.call_method('flickr.contacts.getList',
			'filter'=>filter)
		list = []
		res.elements['/contacts'].each_element do |e|
			att = e.attributes
			nsid = att['nsid']

			person = @flickr.person_cache_lookup(nsid)
			person ||= Flickr::Person.new(nsid,att['username'])

			person.realname = att['realname']
			person.friend = (att['friend'].to_i == 1)
			person.family = (att['family'].to_i == 1)
			person.ignored = (att['ignored'].to_i == 1)

			list << person

			@flickr.person_cache_store(person)
		end
		return list
	end

	# User can be either the NSID String or a Contact
	def getPublicList(user)
		user = user.nsid if user.class == Flickr::Person
		res = @flickr.call_method('flickr.contacts.getPublicList',
			'user_id'=>user)
		list = []
		res.elements['/contacts'].each_element do |e|
			att = e.attributes
			nsid = att['nsid']

			person = @flickr.person_cache_lookup(nsid)
			person ||= Flickr::Person.new(nsid,att['username'])

			person.ignored = (att['ignored'].to_i == 1)
			@flickr.person_cache_store(person)
			list << person
		end
		return list
	end
end
