require_relative "../RequestBase.rb"

class SearchVideos < RequestBase
	
	API_ROUTE = "/v3/search/videos"
    QUERY_PARAM_NAMES = ["age_of_people","collection_codes","collections_filter_type","editorial_video_types","exclude_nudity","fields","format_available","frame_rates",
        "keyword_ids","license_models","page","page_size","phrase","product_types","sort_order","specific_people"]

	QUERY_PARAM_NAMES.each do |key|
		define_method :"with_#{key}" do |value = true| 
			add_parameter(key, value)
			return self
		end
	end

	def execute
		return @http_helper.get(API_ROUTE, @query_params, @headers)			
	end

end