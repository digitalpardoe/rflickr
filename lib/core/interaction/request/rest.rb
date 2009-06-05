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
			query_string << arguments[i][0] + '=' + arguments[i][1] + '&'
		end

		query_string = query_string.chomp('&')

		if proxy = ENV['http_proxy'] || ENV['HTTP_PROXY']
			proxy = URI.parse(proxy)
			agent = Net::HTTP.Proxy(proxy.host, proxy.port)
		else
			agent = Net::HTTP
		end

		agent.get URI.parse(url + query_string)
	end
end
