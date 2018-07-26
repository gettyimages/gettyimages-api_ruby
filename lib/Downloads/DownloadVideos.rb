require_relative "../RequestBase.rb"

class DownloadVideos < RequestBase

    attr_accessor :asset_id, :accept_language

	API_ROUTE = "/v3/downloads/videos" # mashery endpoint	
	QUERY_PARAMS_NAMES = ["product_id","size"]	

	QUERY_PARAMS_NAMES.each do |key|
    define_method :"with_#{key}" do |value = true| 
            if (!key.include? "id") && (value.is_a?(String))
                value.downcase!
            end	
            build_query_params(key, value)
            return self
        end
    end
      
    public 	
    def with_id(asset_id)	
        self.asset_id = asset_id
        return self
    end

    public
	def with_accept_language(language)
		@accept_language = {"Accept-Language" => language}
		return self
	end

    def execute
        build_query_params("auto_download", "false")
        uri = API_ROUTE + "/" + self.asset_id
		return @http_helper.post(uri, @query_params, nil, accept_language)			
	end

end