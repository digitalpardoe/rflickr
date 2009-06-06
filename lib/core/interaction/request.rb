require 'net/http'
require 'uri'

class Request
    def self.make(url, arguments, get)
		get ? get(url, arguments) : post(url, arguments)
	end

	def self.build_url(url, arguments)
		query_string = '?'
		arguments.length.times do |i|
			query_string << arguments[i][0] + '=' + arguments[i][1] + '&'
		end

		url + query_string.chomp('&')
	end

	private
	def self.get(url, arguments)
		

		if proxy = ENV['http_proxy'] || ENV['HTTP_PROXY']
			proxy = URI.parse(proxy)
			agent = Net::HTTP.Proxy(proxy.host, proxy.port)
		else
			agent = Net::HTTP
		end

		agent.get URI.parse(build_url(url, arguments))
	end

	def self.post(url, arguments)
		
	end
end
