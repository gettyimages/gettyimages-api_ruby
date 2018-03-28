require_relative "../RequestBase.rb"

class CustomRequest < RequestBase

    attr_accessor :method, :body, :route
    # @route = "/v3/"

    def initialize(api_key, access_token)
        @route = "/v3/"
        super(api_key, access_token)
    end

    def execute
        case @method
        when "GET"
            return @http_helper.get(@route, @query_params)
        when "POST"
            return @http_helper.post(@route, @query_params, self.body)
        when "PUT"
            return @http_helper.put(@route, @query_params, self.body)
        when "DELETE"
            return @http_helper.delete(@route, @query_params)
        else
            raise "No appropriate HTTP method found for this request."
        end
					
    end
     	
    def with_route(route)	
        @route += route
        return self
    end

    def with_method(method)	
        @method = method
        return self
    end

    def with_query_parameters(params)
        params.each do |key,value|
            if value.is_a?(Array)
				value = value.join(",")
				if !key.include? "id"
					value.downcase!
                end	
                params[key] = value
			else
				if (!key.include? "id") && (value.is_a?(String))
					value.downcase!
                end	
                params[key] = value
            end
        end
        @query_params = params
        return self
    end

    def with_body(body)	
        self.body = body
        return self
    end

end