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

class Flickr::Interestingness < Flickr::APIBase
	def getList(date=nil,extras=nil,per_page=nil,page=nil)
		args = {}
		if date
			args['date'] = date if date.is_a?(String)
			args['date'] = date.to_s if date.is_a?(Date)
			args['date'] = @flickr.mysql_date(date) if
			date.is_a?(Time)
		end
		extras = extras.join(',') if extras.class == Array
		args['extras'] = extras if extras
		args['per_page'] = per_page if per_page
		args['page'] = page if page
		res = @flickr.call_method('flickr.interestingness.getList',args)
		return Flickr::PhotoSet.from_xml(res.root,@flickr)
	end
end
