require_relative "../RequestBase.rb"

class Videos < RequestBase

    attr_accessor :asset_id

	CONNECT_ROUTE = "/v3/videos" # mashery endpoint	

	QUERY_PARAMS_NAMES = ["ids","fields"]

	QUERY_PARAMS_NAMES.each do |key|
    define_method :"with_#{key}" do |value = true| 
            value = value.join(",")
            if !key.include? "id"
                value.downcase!
            end	
            build_query_params(key, value)
    		return self
    	end
  	end
			
	public 
    def with_id(id)
        # if (!@query_params["ids"].nil?)
        #     @query_params.delete("ids")
        # end
        self.asset_id = id
		return self
	end

	public
    def execute
        self.asset_id.nil? ? uri = CONNECT_ROUTE : uri = CONNECT_ROUTE + "/" + self.asset_id
		return @http_helper.get(uri, @query_params)			
	end

end