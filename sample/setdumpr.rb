#!/usr/bin/env ruby

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

# Dump a Ruby marshalled file of all photos by set (and not in set)

require 'flickr'

flickr = Flickr.new('MY_TOKEN')
allsets = flickr.photosets.getList

filename = ARGV.shift or raise Exception.new('Need output filename')

# This really won't hack it if you have more than 500, but then you're
# probably not using this.  I am.
notinsets = flickr.photos.getNotInSet(nil,500)

# Stripped down analog of the Flickr::Photo class
PhotoInfo = Struct.new('PhotoInfo',:title,:id,:secret,:server)

sethash = {}
allsets.each do |set|
	set = flickr.photosets.getInfo(set)
	photohash = {}
	seturl = "http://www.flickr.com/photos/#{set.owner}/sets/#{set.id}"
	sethash[set.title] = [seturl,photohash]
	flickr.photosets.getPhotos(set).each do |photo|
		phi = PhotoInfo.new
		phi.title = photo.title
		phi.secret = photo.secret
		phi.server = photo.server
		phi.id = photo.id
		photohash[phi.title] = phi
	end
end

photohash = {}
sethash[nil] = photohash
notinsets.each do |photo|
	phi = PhotoInfo.new
	phi.title = photo.title
	phi.secret = photo.secret
	phi.server = photo.server
	phi.id = photo.id
	photohash[phi.title] = phi
end

#$stderr.puts sethash.inspect
File.open(filename,'w') { |f| Marshal.dump(sethash,f) }
