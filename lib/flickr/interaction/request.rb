require 'excon'
require 'uri'

class Request
  def self.make(url, arguments, get)
		get ? get(url, arguments) : post(url, arguments)
	end

	def self.build_url(url, arguments)
		query_string = '?'
		arguments.length.times do |i|
			query_string << arguments[i][0].to_s + '=' + arguments[i][1].to_s + '&'
		end

		url + query_string.chomp('&')
	end

	private
	def self.get(url, arguments)    
		Excon.get("#{url}?" + URI.encode_www_form(arguments)).body
	end

	def self.post(url, arguments)
    Excon.post(url, body: URI.encode_www_form(arguments), headers: { "Content-Type" => "application/x-www-form-urlencoded" }).body
	end
end
