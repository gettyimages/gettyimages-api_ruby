require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ApiClient.rb"

 
class CustomRequestsTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://authentication.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_custom_request_get
        stub_request(:get, "https://api.gettyimages.com/v3/search/images")
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("GET")
                    .with_route("search/images")
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    def test_custom_request_get_with_params
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"phrase" => "cat", "fields" => ["id", "title"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("GET")
                    .with_route("search/images")
                    .with_query_parameters({"phrase"=> "cat", "fields"=> ["id", "title"]})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    def test_custom_request_post_with_body
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images").with(body: '{"body":"this body"}')
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("POST")
                    .with_route("downloads/images")
                    .with_body({"body"=> "this body"})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    def test_custom_request_put_with_body
        stub_request(:put, "https://api.gettyimages.com/v3/boards").with(body: '{"body":"this body"}')
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("PUT")
                    .with_route("boards")
                    .with_body({"body"=> "this body"})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    def test_custom_request_delete_with_body
        stub_request(:delete, "https://api.gettyimages.com/v3/boards/123/assets").with(query: {"asset_ids" => ["456", "789"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("DELETE")
                    .with_route("boards/123/assets")
                    .with_query_parameters("asset_ids" => ["456", "789"])
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    def test_custom_request_get_with_headers
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(headers: {"Accept-Language" => "de"}).with(query: {"phrase" => "cat", "fields" => ["id", "title"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("GET")
                    .with_route("search/images")
                    .with_query_parameters({"phrase"=> "cat", "fields"=> ["id", "title"]})
                    .with_headers({"Accept-Language" => "de"})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    def test_custom_request_post_with_headers
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images").with(headers: {"Accept-Language" => "de"}).with(body: '{"body":"this body"}')
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("POST")
                    .with_route("downloads/images")
                    .with_body({"body"=> "this body"})
                    .with_headers({"Accept-Language" => "de"})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    
    def test_custom_request_put_with_headers
        stub_request(:put, "https://api.gettyimages.com/v3/boards").with(headers: {"Accept-Language" => "de"}).with(body: '{"body":"this body"}')
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("PUT")
                    .with_route("boards")
                    .with_body({"body"=> "this body"})
                    .with_headers({"Accept-Language" => "de"})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

    
    def test_custom_request_delete_with_headers
        stub_request(:delete, "https://api.gettyimages.com/v3/boards/123/assets").with(headers: {"Accept-Language" => "de"}).with(query: {"asset_ids" => ["456", "789"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        results	= apiClient.custom_request()
                    .with_method("DELETE")
                    .with_route("boards/123/assets")
                    .with_query_parameters("asset_ids" => ["456", "789"])
                    .with_headers({"Accept-Language" => "de"})
                    .execute()

        assert_equal({"message" => "success"}, results.to_hash )
    end

end