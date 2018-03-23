# Getty Images Connect SDK 

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
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
results = connectSdk
	.search_images()
	.with_phrase("gorilla")
	.with_fields(["artist", "id", "title"])
	.with_exclude_nudity("true")
	.with_page(2)
	.with_page_size(5)
	.execute()
    
results["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end
```

### Get detailed information for one image
```ruby
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
result = connectSdk
	.images()
	.with_id("ASSET_ID")
	.execute()
    
puts result
```

### Get detailed information for multiple images
```ruby
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
results = connectSdk
	.images()
	.with_ids(["ASSET_ID_1", "ASSET_ID_2"])
	.execute()
    
results["images"].each do | image |
    puts image
end
```

### Download an image
```ruby
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
result = connectSdk
	.download_images()
	.with_id("ASSET_ID")
	.execute()
    
puts result["uri"]
```

### Use the custom request functionality for GET request with query parameters
```ruby
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
results = connectSdk
	.custom_request()
	.with_method("GET")
	.with_route("search/images")
	.with_query_parameters({"phrase"=> "cat", "fields"=> ["artist", "id", "title"], "page" => 2})
	.execute()
        
results["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end
```

### Use the custom request functionality for POST request with body
```ruby
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
result = connectSdk
	.custom_request()
	.with_method("POST")
	.with_route("boards")
	.with_body({"name"=> "Board Name", "description" => "Board Description"})
	.execute()
	
puts result["id"]
```
 
## Unit Tests

To execute all unit tests: 

	$ ruby unit_tests/Run.rb

To run one unit test file:

	$ ruby unit_tests/FILENAME.rb
