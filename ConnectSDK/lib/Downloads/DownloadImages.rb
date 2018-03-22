require_relative "../RequestBase.rb"

class DownloadImages < RequestBase

    attr_accessor :asset_id

	CONNECT_ROUTE = "/v3/downloads/images" # mashery endpoint	
	QUERY_PARAMS_NAMES = ["file_type","height","product_id","product_type"]	

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

    def execute
        build_query_params("auto_download", "false")
        uri = CONNECT_ROUTE + "/" + self.asset_id
		return @http_helper.post(uri, @query_params, nil)			
	end

end