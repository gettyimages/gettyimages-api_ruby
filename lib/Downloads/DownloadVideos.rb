require_relative "../RequestBase.rb"

class DownloadVideos < RequestBase

    attr_accessor :asset_id

	API_ROUTE = "/v3/downloads/videos"
	QUERY_PARAM_NAMES = ["product_id","size"]	

	QUERY_PARAM_NAMES.each do |key|
		define_method :"with_#{key}" do |value = true| 
			add_parameter(key, value)
			return self
		end
	end
      
    public 	
    def with_id(asset_id)	
        self.asset_id = asset_id
        return self
    end

    def execute
        build_query_params("auto_download", "false")
        uri = API_ROUTE + "/" + self.asset_id
		return @http_helper.post(uri, @query_params, nil, @headers)			
	end

end