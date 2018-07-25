require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ApiClient.rb"

 
class SearchVideosEditorialTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://api.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_search_videos_editorial_with_accept_language
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(headers: {"Accept-Language" => "de"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_accept_language("de")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_age_of_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"age_of_people" => ["newborn", "adult", "child"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_age_of_people(["newborn", "adult"])
                            .with_age_of_people("child")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_collection_codes
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"collection_codes" => ["wri", "arf"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_collection_codes(["WRI", "ARF"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_collections_filter_type
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"collections_filter_type" => "exclude"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_collections_filter_type("exclude")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_editorial_video_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"editorial_video_types" => ["raw", "produced"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_editorial_video_types(["raw","produced"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_entity_uris
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"entity_uris" => ["example_uri_1", "example_uri_2"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_entity_uris(["example_uri_1","example_uri_2"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_exclude_nudity
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"exclude_nudity" => "true"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_exclude_nudity("true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_fields
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"fields" => ["allowed_use", "caption"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_fields(["allowed_use", "caption"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_format_available
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"format_available" => "hd"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_format_available("HD")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_frame_rates
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"frame_rates" => ["24", "29.97"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_frame_rates(["24", "29.97"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_keyword_ids
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"keyword_ids" => ["A123", "B456"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_keyword_ids(["A123", "B456"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_page
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"page" => "3"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_page(3)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_page_size
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"page_size" => "50"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_page_size(50)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
    
    def test_search_videos_editorial_with_phrase
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"phrase" => "cat"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_phrase("CAT")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_product_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"product_types" => ["easyaccess","imagepack"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_product_types(["easyaccess","imagepack"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_sort_order
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"sort_order" => "newest"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_sort_order("newest")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_editorial_with_specific_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/editorial").with(query: {"specific_people" => "reggie jackson"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_videos_editorial()
                            .with_specific_people(["Reggie Jackson"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
 
end