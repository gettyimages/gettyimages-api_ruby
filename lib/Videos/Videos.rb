require_relative "../RequestBase.rb"

class Videos < RequestBase

    attr_accessor :asset_id

	API_ROUTE = "/v3/videos"
	QUERY_PARAM_NAMES = ["ids","fields"]

	QUERY_PARAM_NAMES.each do |key|
		define_method :"with_#{key}" do |value = true| 
			add_parameter(key, value)
			return self
		end
	end
			
	public 
    def with_id(id)
        self.asset_id = id
		return self
	end


	public
    def execute
        self.asset_id.nil? ? uri = API_ROUTE : uri = API_ROUTE + "/" + self.asset_id
		return @http_helper.get(uri, @query_params, @headers)			
	end

end