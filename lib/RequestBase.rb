require_relative "HttpHelper"

class RequestBase

	attr_accessor :http_helper, :query_params, :headers

	def initialize(api_key, access_token)
		
		#puts "here is my token #{access_token}" 		
		@http_helper = HttpHelper.new(api_key, access_token)						
		@query_params = Hash.new
		@headers = Hash.new

	end	

	protected
	def build_query_params(key, value)
		@query_params[key].nil? ? @query_params[key] = value : @query_params[key] << "," + value
	end 

	protected
	def add_parameter(key, value)
		if value.is_a?(Array)
			value = value.join(",")
			if (!key.include? "id") && (!key.include? "orientations")
				value.downcase!
			end	
			build_query_params(key, value)
		else
			if (!key.include? "id") && (!key.include? "orientations") && (value.is_a?(String))
				value.downcase!
			end	
			build_query_params(key, value)
		end
	end

	public
	def with_accept_language(language)
		@headers["Accept-Language"] = language
		return self
	end

	public
	def with_custom_header(key, value)
		@headers[key] = value
		return self
	end

	public
	def with_custom_parameter(key, value)
		add_parameter(key, value)
		return self
	end
end