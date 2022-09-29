require_relative "../RequestBase.rb"

class SearchImagesEditorial < RequestBase

	API_ROUTE = "/v3/search/images/editorial"
    QUERY_PARAM_NAMES = ["age_of_people","artists","collection_codes","collections_filter_type","compositions","editorial_segments","embed_content_only","end_date","entity_uris","ethnicity",
        "event_ids","exclude_nudity","fields","file_types","graphical_styles","keyword_ids","minimum_quality_rank","minimum_size","number_of_people","orientations","page","page_size","phrase",
        "product_types","sort_order","specific_people","start_date"]

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