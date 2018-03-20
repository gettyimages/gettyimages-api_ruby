require_relative "RequestBase"

class SearchImagesEditorial < RequestBase

	CONNECT_ROUTE = "/v3/search/images/editorial" # mashery endpoint	
	@@search_route = CONNECT_ROUTE
    QUERY_PARAMS_NAMES = ["age_of_people","artists","collection_codes","collections_filter_type","compositions","editorial_segments","embed_content_only","end_date","entity_uris","ethnicity",
        "event_ids","exclude_nudity","fields","file_types","graphical_styles","keyword_ids","minimum_quality_rank","minimum_size","number_of_people","orientations","page","page_size","phrase",
        "product_types","sort_order","specific_people","start_date"]

	QUERY_PARAMS_NAMES.each do |key|
    define_method :"with_#{key}" do |value = true| 
			if value.is_a?(Array)
				value = value.join(",")
				if !key.include? "id"
					value.downcase!
				end	
    			build_query_params(key, value)
			else
				if (!key.include? "id") && (value.is_a?(String))
					value.downcase!
				end	
    			build_query_params(key, value)
    		end
    		return self
    	end
  	end

	def execute
		return @http_helper.get(@@search_route, @query_params)			
	end

end