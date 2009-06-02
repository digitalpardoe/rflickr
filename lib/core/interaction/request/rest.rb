require 'net/http'
require 'uri'

class Rest
    def self.make_request(url, arguments, get)
		if (get)
			get_request(url, arguments)
		elsif
			puts "Not implemented yet."
		end
	end

	private
	def self.get_request(url, arguments)
		query_string = '?'
		arguments.length.times do |i|
			query_string << arguments[i][0] + '=' + arguments[i][1]

			if (i != (arguments.length - 1))
				query_string << '&'
			end
		end

		if proxy = ENV['http_proxy']
			proxy = URI.parse(proxy)
			Net::HTTP.Proxy(proxy.host, proxy.port).get URI.parse(url + query_string)
		else
			Net::HTTP.get URI.parse(url + query_string)
		end
	end
end
