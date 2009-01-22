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

require 'flickr'

flickr = Flickr.new('MY_TOKEN')

sets = flickr.photosets.getList

# Get the sets that AREN'T comics and put them at the start.
flickr.photosets.orderSets(sets.find_all { |set| !(set.title =~ /^Comics /) })

# Get the latest comic set and make its photos invisible (I assume
# that since this runs daily, we only need to do the latest
# set...otherwise find_all.each would do the trick.
set = sets.find { |set| set.title =~ /^Comics / }
set.fetch.each { |p| flickr.photos.setPerms(p,false,false,false,0,0) }
