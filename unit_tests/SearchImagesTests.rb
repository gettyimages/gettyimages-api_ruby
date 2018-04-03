
require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ApiClient.rb"

 
class SearchImagesTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://api.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_search_images_with_age_of_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"age_of_people" => ["newborn", "adult", "child"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_age_of_people(["newborn", "adult"])
                            .with_age_of_people("child")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_artists
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"artists" => ["roman makhmutov", "linda raymond"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_artists(["roman makhmutov", "Linda Raymond"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_collection_codes
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"collection_codes" => ["wri", "arf"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_collection_codes(["WRI", "ARF"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_collections_filter_type
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"collections_filter_type" => "exclude"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_collections_filter_type("exclude")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_color
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"color" => "#002244"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_color("#002244")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_compositions
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"compositions" => ["abstract", "headshot"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_compositions(["abstract", "headshot"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_embed_content_only
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"embed_content_only" => "true"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_embed_content_only("true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_ethnicity
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"ethnicity" => ["black", "japanese"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_ethnicity(["black", "japanese"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_event_ids
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"event_ids" => ["A123", "B456"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_event_ids(["A123", "B456"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_exclude_nudity
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"exclude_nudity" => "true"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_exclude_nudity("true")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_fields
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"fields" => ["allowed_use", "caption"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_fields(["allowed_use", "caption"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_file_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"file_types" => "jpg"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_file_types("jpg")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_graphical_styles
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"graphical_styles" => ["fine_art", "photography"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_graphical_styles(["fine_art", "photography"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_keyword_ids
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"keyword_ids" => ["A123", "B456"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_keyword_ids(["A123", "B456"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_license_models
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"license_models" => ["rightsmanaged", "royaltyfree"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_license_models(["rightsmanaged", "royaltyfree"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_minimum_size
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"minimum_size" => "small"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_minimum_size("small")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_number_of_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"number_of_people" => ["group", "one"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_number_of_people(["group", "one"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_orientations
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"orientations" => ["Horizontal", "Square"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_orientations(["Horizontal", "Square"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_page
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"page" => "3"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_page(3)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_page_size
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"page_size" => "50"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_page_size(50)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
    
    def test_search_images_with_phrase
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"phrase" => "cat"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_phrase("CAT")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_prestige_content_only
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"prestige_content_only" => "true"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_prestige_content_only(true)
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_product_types
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"product_types" => ["easyaccess","imagepack"].join(",")})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_product_types(["easyaccess","imagepack"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_sort_order
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"sort_order" => "newest"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_sort_order("newest")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_search_images_with_specific_people
        stub_request(:get, "https://api.gettyimages.com/v3/search/images").with(query: {"specific_people" => "reggie jackson"})
            .to_return(body: '{ "message": "success" }')

        apiClient 		= ApiClient.new("api key", "api secret")
        search_results	= apiClient.search_images()
                            .with_specific_people(["Reggie Jackson"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end
 
end