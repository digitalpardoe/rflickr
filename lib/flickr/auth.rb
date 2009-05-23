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

class Flickr::Auth < Flickr::APIBase
	attr_accessor :cache_file, :token

	def clear_cache
		@token = nil
		@frob = nil
	end

	def initialize(flickr,cache_file=nil)
		super(flickr)
		@frob = nil
		@token = nil
		@cache_file = cache_file
		if @cache_file && File.exists?(@cache_file)
			load_token
		end
	end

	def login_link(perms='delete')
		args={ 'api_key' => @flickr.api_key, 'perms' => perms}
		args['frob'] = self.frob
		args['api_sig'] = @flickr.sign(args)
		return "http://flickr.com/services/auth/?"+
		  args.to_a.map{|arr| arr.join('=')}.join('&')
	end

	def frob=(frob) @frob = frob end
	def frob() return @frob || getFrob end

	def cache_token
		File.open(@cache_file,'w'){ |f| f.write @token.to_xml } if token
	end

	def load_token
		token = nil
		File.open(@cache_file,'r'){ |f| token = f.read }
		# Dirt stupid check to see if it's probably XML or
		# not.  If it is, then we don't call checkToken.
		#
		# Backwwards compatible with old token storage.
		@token = token.include?('<') ?
		  Flickr::Token.from_xml(REXML::Document.new(token)) :
		  @token = checkToken(token)
	end

	def getToken(frob=nil)
		frob ||= @frob
		res=@flickr.call_unauth_method('flickr.auth.getToken',
			'frob'=>frob)
		@token = Flickr::Token.from_xml(res)
	end

	def getFullToken(mini_token)
		res = flickr.call_unauth_method('flickr.auth.getFullToken',
			'mini_token' => mini_token)
		@token = Flickr::Token.from_xml(res)
	end

	def getFrob
		doc = @flickr.call_unauth_method('flickr.auth.getFrob')
		@frob = doc.elements['/frob'].text
		return @frob
	end

	def checkToken(token=nil)
		token ||= @token
		token = token.token if token.class == Flickr::Token
		res = @flickr.call_unauth_method('flickr.auth.checkToken',
			'auth_token' => token)
		@token = Flickr::Token.from_xml(res)
	end
end
