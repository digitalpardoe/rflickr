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


t0 = Time.now
require 'flickr'

t1 = Time.now

flickr = Flickr.new('MY_TOKEN')

setname = ARGV.shift

sets = flickr.photosets.getList
t2 = Time.now
set = sets.find{|s| s.title == setname} # May be nil, we handle that later.
set &&= set.fetch
t3 = Time.now
set.each do |photo|
	str =<<EOF
<a href="#{photo.url}"><img src="#{photo.url('s')}" alt="#{photo.title}"></a>
EOF
	print str.strip+' '
end
t4 = Time.now

puts "\n\n\n"
puts "Library load: #{t1-t0} seconds"
puts "photosets.getList: #{t2-t1} seconds"
puts "Set fetching: #{t3-t2} seconds"
puts "Formatting: #{t4-t3} seconds"
puts "TOTAL: #{t4-t0} seconds"
