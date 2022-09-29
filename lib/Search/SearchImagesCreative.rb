require_relative "../RequestBase.rb"

class SearchImagesCreative < RequestBase

	QUERY_PARAM_NAMES = ["age_of_people","artists","collection_codes","collections_filter_type","color","compositions","embed_content_only","ethnicity","exclude_nudity","fields","file_types",
		"graphical_styles","keyword_ids","minimum_size","number_of_people","orientations","page","page_size","phrase","prestige_content_only","product_types",
		"sort_order"]

	def initialize(api_key, access_token)
		super
		@api_route = "/v3/search/images/creative"
	end

	QUERY_PARAM_NAMES.each do |key|
    define_method :"with_#{key}" do |value = true| 
			add_parameter(key, value)
    		return self
    	end
	end
	  		  
	def execute
		return @http_helper.get(@api_route, @query_params, @headers)			
	end

end