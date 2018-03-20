require 'test/unit'
require 'webmock/test_unit'
require_relative "../ConnectSDK/lib/ConnectSDK.rb"

 
class SearchVideosCreativeTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://api.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_search_videos_creative_with_age_of_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"age_of_people" => ["newborn", "adult", "child"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_age_of_people(["newborn", "adult"])
                            .with_age_of_people("child")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_collection_codes
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"collection_codes" => ["wri", "arf"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_collection_codes(["WRI", "ARF"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_collections_filter_type
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"collections_filter_type" => "exclude"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_collections_filter_type("exclude")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_exclude_nudity
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"exclude_nudity" => "true"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_exclude_nudity("true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_fields
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"fields" => ["allowed_use", "caption"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_fields(["allowed_use", "caption"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_format_available
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"format_available" => "hd"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_format_available("HD")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_frame_rates
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"frame_rates" => ["24", "29.97"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_frame_rates(["24", "29.97"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_keyword_ids
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"keyword_ids" => ["A123", "B456"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_keyword_ids(["A123", "B456"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_license_models
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"license_models" => ["rightsmanaged", "royaltyfree"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_license_models(["rightsmanaged", "royaltyfree"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_page
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"page" => "3"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_page(3)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_page_size
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"page_size" => "50"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_page_size(50)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
    
    def test_search_videos_creative_with_phrase
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"phrase" => "cat"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_phrase("CAT")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_product_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"product_types" => ["easyaccess","imagepack"].join(",")}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_product_types(["easyaccess","imagepack"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_videos_creative_with_sort_order
        stub_request(:get, "https://api.gettyimages.com/v3/search/videos/creative").with(query: hash_including({"sort_order" => "newest"}))
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_videos_creative()
                            .with_sort_order("newest")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
 
end