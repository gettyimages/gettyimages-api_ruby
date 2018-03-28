require 'test/unit'
require 'webmock/test_unit'
require_relative "../lib/ConnectSDK.rb"

 
class VideosTests < Test::Unit::TestCase
    def setup
        stub_request(:post, "https://api.gettyimages.com/oauth2/token").with(body: {"client_id"=>"api key", "client_secret"=>"api secret", "grant_type"=>"client_credentials"})
        .to_return(status: 200, body: '{"access_token": "client_credentials_access_token", "token_types": "Bearer", "expires_in": "1800"}')
    end

    def test_videos_with_ids
        stub_request(:get, "https://api.gettyimages.com/v3/videos").with(query: {"ids" => ["123","333"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.videos()
                            .with_ids(["123", "333"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_videos_with_id
        stub_request(:get, "https://api.gettyimages.com/v3/videos/123")
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.videos()
                            .with_id("123")
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

    def test_videos_with_ids_with_fields
        stub_request(:get, "https://api.gettyimages.com/v3/videos").with(query: {"ids" => ["123","333"].join(","), "fields" => ["caption","keywords"].join(",")})
            .to_return(body: '{ "message": "success" }')

        connectSdk 		= ConnectSdk.new("api key", "api secret")
        search_results	= connectSdk.videos()
                            .with_ids(["123", "333"])
                            .with_fields(["caption","keywords"])
                            .execute()

        assert_equal({"message" => "success"}, search_results.to_hash )
    end

end