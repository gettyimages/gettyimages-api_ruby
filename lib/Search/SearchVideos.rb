require_relative "../RequestBase.rb"

class SearchVideos < RequestBase

	attr_accessor :accept_language
	
	API_ROUTE = "/v3/search/videos" # mashery endpoint	
    QUERY_PARAMS_NAMES = ["age_of_people","collection_codes","collections_filter_type","editorial_video_types","exclude_nudity","fields","format_available","frame_rates",
        "keyword_ids","license_models","page","page_size","phrase","product_types","sort_order","specific_people"]

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
	
	def with_accept_language(language)
		@accept_language = {"Accept-Language" => language}
		return self
	end

	def execute
		return @http_helper.get(API_ROUTE, @query_params, @accept_language)			
	end

end