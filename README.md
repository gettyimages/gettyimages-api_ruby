# Getty Images API Ruby SDK

Seamlessly integrate Getty Images' expansive digital content, powerful search technology, and rich metadata into your publishing tools, products and services!

- Search for images and videos from our extensive creative and editorial catalogs.
- Get image and video metadata.
- Download files using your Getty Images products (e.g., Editorial subscriptions, Easy Access, Thinkstock Subscriptions, and Image Packs).
- Custom Request functionality that allows user to call any endpoint.

## Requirements

- Ruby version > 2.4
- [Bundler](http://bundler.io)

## Examples

### Search for one or more images

```ruby
require "GettyImagesApi"

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .search_images()
    .with_phrase("gorilla")
    .with_fields(["artist", "id", "title"])
    .with_exclude_nudity("true")
    .with_page(2)
    .with_page_size(5)
    .execute()

result["images"].each do | image |
    puts "Id: #{image["id"]} Title: #{image["title"]}"
end
```

### Get detailed information for one image

```ruby
require "GettyImagesApi"

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .images()
    .with_id("ASSET_ID")
    .execute()

puts result
```

### Get detailed information for multiple images

```ruby
require "GettyImagesApi"

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .images()
    .with_ids(["ASSET_ID_1", "ASSET_ID_2"])
    .execute()

result["images"].each do | image |
    puts image
end
```

### Download an image

```ruby
require "GettyImagesApi"

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .download_images()
    .with_id("ASSET_ID")
    .execute()

puts result["uri"]
```

### Use the custom request functionality for GET request with query parameters

```ruby
require "GettyImagesApi"

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .custom_request()
    .with_method("GET")
    .with_route("search/images")
    .with_query_parameters({"phrase"=> "cat", "fields"=> ["artist", "id", "title"], "page" => 2})
    .execute()

result["images"].each do | image |
    puts "Id: #{image["id"]} Title: #{image["title"]}"
end
```

### Use the custom request functionality for POST request with body

```ruby
require "GettyImagesApi"

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .custom_request()
    .with_method("POST")
    .with_route("boards")
    .with_body({"name"=> "Board Name", "description" => "Board Description"})
    .execute()

puts result["id"]
```

## Unit Tests

Install bundler and all dependencies

```sh
gem install bundler
bundle install
```

To execute all unit tests:

```sh
rake
```

To run one unit test file:

```sh
ruby unit_tests/FILENAME.rb
```
