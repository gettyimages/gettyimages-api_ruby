require_relative "../RequestBase.rb"

class SearchImages < RequestBase

	attr_accessor :accept_language

	API_ROUTE = "/v3/search/images" # mashery endpoint
	QUERY_PARAMS_NAMES = ["age_of_people","artists","collection_codes","collections_filter_type","color","compositions","embed_content_only","ethnicity","event_ids","exclude_nudity","fields",
		"file_types","graphical_styles","keyword_ids","minimum_size","number_of_people","orientations","page","page_size","phrase","prestige_content_only","product_types",
		"sort_order","specific_people"]

	QUERY_PARAMS_NAMES.each do |key|
    define_method :"with_#{key}" do |value = true| 
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

