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

class Flickr::Licenses < Flickr::APIBase
	def getInfo
		return @flickr.license_cache_lookup if
		@flickr.license_cache_lookup
		list = {}
		res = @flickr.call_method('flickr.photos.licenses.getInfo')
		res.elements['/licenses'].each_element do |el|
			lic = Flickr::License.from_xml(el)
			list[lic.id] = lic
		end
		@flickr.license_cache_store(list)
		return list
	end
	
	def setLicense(photo,license)
		photo = photo.id if photo.class == Flickr::Photo
		license = license.id if license.class == Flickr::License
		@flickr.call_method('flickr.photos.licenses.setLicense',
			'photo_id' => photo, 'license_id' => license)
	end
end
