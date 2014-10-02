require_relative "RequestBase"

class SearchImages < RequestBase

	CONNECT_ROUTE = "/v3/search/images" # mashery endpoint	
	@@search_route = CONNECT_ROUTE
	QUERY_PARAMS_NAMES = ["phrase","editorial_segments","graphical_styles","license_models","orientations","exclude_nudity","embed_content_only","page","page_size"]

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

	# {https://connect.gettyimages.com/swagger/ui/index.html#!/Search/Search_GetCreativeImagesByPhrase Creative Swagger}
	# with_graphical_styles
	# with_license_models
	def creative()
		@@search_route = "#{CONNECT_ROUTE}/creative"
		return self
	end	

	def editorial()
		@@search_route = "#{CONNECT_ROUTE}/editorial"
		return self
	end

	def execute
		return @http_helper.get(@@search_route, @query_params)			
	end

end

