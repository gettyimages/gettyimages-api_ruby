require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ApiClient.rb"

 
class CustomParamHeaderTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://authentication.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_search_images_creative_with_custom_header
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/creative").with(headers: {"GI-Country-Code" => "CAN"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images_creative()
                            .with_custom_header("GI-Country-Code", "CAN")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_creative_with_custom_parameter
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/creative").with(query: {"safe_search" => "true"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images_creative()
                            .with_custom_parameter("safe_search", "true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
 
end