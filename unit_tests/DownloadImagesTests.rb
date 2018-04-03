require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ApiClient.rb"

 
class DownloadImagesTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://api.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_download_images_with_id
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images/123").with(query: {"auto_download" => "false"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.download_images()
                            .with_id("123")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_download_images_with_id_with_file_type
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images/123").with(query: {"auto_download" => "false", "file_type" => "jpg"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.download_images()
                            .with_id("123")
                            .with_file_type("jpg")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_download_images_with_id_with_height
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images/123").with(query: {"auto_download" => "false", "height" => "592"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.download_images()
                            .with_id("123")
                            .with_height("592")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_download_images_with_id_with_product_id
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images/123").with(query: {"auto_download" => "false", "product_id" => "567"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.download_images()
                            .with_id("123")
                            .with_product_id(567)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_download_images_with_id_with_product_type
        stub_request(:post, "https://api.gettyimages.com/v3/downloads/images/123").with(query: {"auto_download" => "false", "product_type" => "easyaccess"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.download_images()
                            .with_id("123")
                            .with_product_type("easyaccess")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

end