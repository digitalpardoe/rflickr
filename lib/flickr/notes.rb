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

class Flickr::Notes < Flickr::APIBase
	def add(photo,x,y,w,h,text)
		photo = photo.id if photo.class == Flickr::Photo
		res = @flickr.call_method('flickr.photos.notes.add',
			'photo_id' => photo, 'note_x' => x, 'note_y' => y,
			'note_w' => w, 'note_h' => h, 'note_text' => text)
		return res.elements['/note'].attributes['id']
	end

	def delete(note)
		note = note.id if note.class == Flickr::Note
		res = @flickr.call_method('flickr.photos.notes.delete',
			'note_id' => note)
	end

	def edit(note,x,y,w,h,text)
		note = note.id if note.class == Flickr::Note
		res = @flickr.call_method('flickr.photos.notes.edit',
			'note_id' => note, 'note_x' => x, 'note_y' => y,
			'note_w' => w, 'note_h' => h, 'note_text' => text)
	end
end
