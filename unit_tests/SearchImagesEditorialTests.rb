require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ConnectSDK.rb"

 
class SearchImagesEditorialTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://api.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_search_images_editorial_with_age_of_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"age_of_people" => ["newborn", "adult", "child"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_age_of_people(["newborn", "adult"])
                            .with_age_of_people("child")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_artists
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"artists" => ["roman makhmutov", "linda raymond"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_artists(["roman makhmutov", "Linda Raymond"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_collection_codes
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"collection_codes" => ["wri", "arf"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_collection_codes(["WRI", "ARF"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_collections_filter_type
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"collections_filter_type" => "exclude"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_collections_filter_type("exclude")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_compositions
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"compositions" => ["abstract", "headshot"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_compositions(["abstract", "headshot"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_editorial_segments
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"editorial_segments" => ["archival", "sport"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_editorial_segments(["archival", "sport"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_embed_content_only
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"embed_content_only" => "true"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_embed_content_only("true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_end_date
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"end_date" => "2015-04-01"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_end_date("2015-04-01")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_entity_uris
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"entity_uris" => ["example_uri_1", "example_uri_2"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_entity_uris(["example_uri_1", "example_uri_2"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_ethnicity
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"ethnicity" => ["black", "japanese"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_ethnicity(["black", "japanese"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_event_ids
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"event_ids" => ["A123", "B456"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_event_ids(["A123", "B456"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_exclude_nudity
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"exclude_nudity" => "true"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_exclude_nudity("true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_fields
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"fields" => ["allowed_use", "caption"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_fields(["allowed_use", "caption"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_file_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"file_types" => "jpg"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_file_types("jpg")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_graphical_styles
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"graphical_styles" => ["fine_art", "photography"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_graphical_styles(["fine_art", "photography"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_keyword_ids
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"keyword_ids" => ["A123", "B456"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_keyword_ids(["A123", "B456"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_minimum_quality_rank
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"minimum_quality_rank" => "2"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_minimum_quality_rank(2)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_minimum_size
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"minimum_size" => "small"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_minimum_size("small")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_number_of_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"number_of_people" => ["group", "one"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_number_of_people(["group", "one"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_orientations
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"orientations" => ["Horizontal", "Square"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_orientations(["Horizontal", "Square"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_page
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"page" => "3"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_page(3)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_page_size
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"page_size" => "50"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_page_size(50)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
    
    def test_search_images_editorial_with_phrase
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"phrase" => "cat"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_phrase("CAT")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_product_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"product_types" => ["easyaccess","imagepack"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_product_types(["easyaccess","imagepack"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_sort_order
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"sort_order" => "newest"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_sort_order("newest")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_specific_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"specific_people" => "reggie jackson"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_specific_people(["Reggie Jackson"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_editorial_with_start_date
        stub_request(:get, "https://api.gettyimages.com/v3/search/images/editorial").with(query: {"start_date" => "2015-04-01"})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.search_images_editorial()
                            .with_start_date("2015-04-01")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
 
end