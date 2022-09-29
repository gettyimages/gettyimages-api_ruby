# Getty Images API Ruby SDK
[![Build Status](https://travis-ci.org/gettyimages/gettyimages-api_ruby.svg?branch=master)](https://travis-ci.org/gettyimages/gettyimages-api_ruby)  

## Introduction
This SDK makes using the Getty Images [API](http://developers.gettyimages.com) easy. It handles credential management, makes HTTP requests and is written with a fluent style in mind. For more info about the API, see the [Documentation](https://developers.gettyimages.com/api/).

* Search for images and videos from our extensive creative and editorial catalogs.
* Get image and video metadata.
* Download files using your Getty Images products (e.g., Editorial subscriptions, Easy Access, Thinkstock Subscriptions, and Image Packs).
* Custom Request functionality that allows user to call any endpoint.

## Help & Support

* [Getty Images API](http://developers.gettyimages.com/)
* [Issue Tracker](https://github.com/gettyimages/gettyimages-api_ruby/issues)

## Getting started

### Obtain an API Key

If you don't already have an API key, fill out and submit the [contact form](http://engage.gettyimages.com/api-contact) to be connected to our Sales team.

### Installing the ruby gem package

The SDK is available as a [ruby gem](https://rubygems.org/gems/gettyimages-api) package. Install in your workspace with:
```sh
gem install gettyimages-api
```

## Examples

### Search for one or more images

```ruby
require 'gettyimages-api'

api_key = "API Key"
api_secret = "API Secret"

# create instance of the SDK
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .search_images_creative()
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
require 'gettyimages-api'

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
require 'gettyimages-api'

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
require 'gettyimages-api'

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

### Make a request using custom parameter and header

```ruby
apiClient = ApiClient.new(api_key, api_secret)
result = apiClient
    .search_images_creative()
    .with_phrase("beach")
    .with_custom_parameter("safe_search", "true")
    .with_custom_header("gi-country-code", "CAN")
    .execute()
```

### Use the custom request functionality for GET request with query parameters

```ruby
require 'gettyimages-api'

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
require 'gettyimages-api'

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
## Running Source Code
_Source code is only needed if you would like to contribute to the project. Otherwise, use the [ruby gem](https://rubygems.org/gems/gettyimages-api)_

### Requirements

- Ruby version >= 2.5
- [Bundler](http://bundler.io)

Install bundler and all dependencies

```sh
gem install bundler
bundle install
```

### Unit Tests

To execute all unit tests:

```sh
rake
```

To run one unit test file:

```sh
ruby unit_tests/FILENAME.rb
```
