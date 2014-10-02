require_relative "RequestBase"

class ImagesRequest < RequestBase

	CONNECT_ROUTE = "/v3/images" # mashery endpoint	

	QUERY_PARAMS_NAMES = ["page","page_size"]

	QUERY_PARAMS_NAMES.each do |key|
    define_method :"with_#{key}" do |value = true| 
    		if value.is_a?(Array)
    			build_query_params(key, value.join(","))
    		else
    			build_query_params(key, value)
    		end
    		return self
    	end
  	end
			
	public 
	def with_ids(ids)
		@ids = ids.join("%2C") 
		return self
	end

	public
	def execute
		return @http_helper.get("#{CONNECT_ROUTE}/#{@ids}", @query_params)			
		return "here"
	end

end
