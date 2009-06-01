require 'net/http'
require 'uri'

module Rest
    def make_request(url, arguments, post)
		if (post)
			post_request(url, sort_arguments(arguments))
		else
			get_request(url, sort_arguments(arguments))
		end
	end

	def get_request(url, arguments)
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

	def sort_arguments(arguments)
		arguments.sort{ |a,b| a[0]<=>b[0] }
	end
end
