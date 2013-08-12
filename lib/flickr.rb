Dir[File.dirname(__FILE__) + "/flickr/**/*.rb"].each { |file| require file }

class Flickr
	def initialize(api_key, shared_secret, auth_token=nil)
		@tokens = Flickr::Tokens.new(api_key, shared_secret, auth_token)
		@api_request = FlickrApiRequest.new(@tokens)
	end

	def auth_token(auth_token)
		@tokens.auth_token = auth_token
		self
	end

	class Tokens
		attr_reader :api_key, :shared_secret
		attr_accessor :auth_token

		def initialize(api_key, shared_secret, auth_token)
			@api_key = api_key
			@shared_secret = shared_secret
			@auth_token = auth_token
		end
	end

	def api
		@api ||= Api.new(@api_request, self)
	end

  def method_missing(method, *arguments, &block)
    if method.to_s =~ /^flickr_[\w]+/
      self.class.send :define_method, method do |*arguments|
        if (arguments = arguments.flatten) != []
          args = arguments[0][:args]
          auth = arguments[0][:auth]
          get = arguments[0][:get]
        end

        @api_request.call("#{method.to_s.gsub('_', '.')}", args || {}, (auth == nil ? false : auth), (get == nil ? true : get))
      end
      self.send(method, arguments)
    else
      super
    end
  end
end