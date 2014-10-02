require_relative "HttpHelper"

class RequestBase

	attr_accessor :http_helper, :query_params

	def initialize(api_key, access_token)
		
		#puts "here is my token #{access_token}" 		
		@http_helper = HttpHelper.new(api_key, access_token)						
		@query_params = Hash.new

	end	

	public 
	def with_response_fields(fields)
		build_query_params("fields", fields.join(","))
		return self
	end

	public 
	def with_response_field(field)
		build_query_params("fields", field)
		return self
	end

	protected
	def build_query_params(key, value)
		@query_params[key].nil? ? @query_params[key] = value : @query_params[key] << "," + value
	end 


end