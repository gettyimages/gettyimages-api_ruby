require_relative "../RequestBase.rb"

class SearchVideosCreative < RequestBase

	API_ROUTE = "/v3/search/videos/creative" # mashery endpoint	
    QUERY_PARAMS_NAMES = ["age_of_people","collection_codes","collections_filter_type","exclude_nudity","fields","format_available","frame_rates",
        "keyword_ids","license_models","page","page_size","phrase","product_types","sort_order"]

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
		return @http_helper.get(API_ROUTE, @query_params)			
	end

end