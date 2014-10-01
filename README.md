# Getty Images Connect SDK 
Seamlessly integrate Getty Images' expansive digital content, powerful search technology, and rich metadata into your publishing tools, products and services!

- Search for images from our extensive creative and editorial catalogs.
- Get image metadata.
- Download files using your Getty Images products (e.g., Editorial subscriptions, Easy Access, Thinkstock Subscriptions, and Image Packs).

## Requirements
Ruby version > 1.9.3

## Building GEM Package
The following describes how to create the local gem package for ConnectSDK. The package will be created in the pkg folder in the source code location. 

	Source Code Location: connect_sdk_ruby/ConnectSDK/lib/
	$ bundle exec rake release

## Installation
**[NOTE: Currently not published to [rubygems.org](https://rubygems.org), install from local build package.]**

Add this line to your application's Gemfile:

```ruby
gem 'ConnectSDK'
```

And then execute:

    $ bundle

Or install it yourself as:

	Package: connect_sdk_ruby/ConnectSDK/lib/pkg
    $ gem install ConnectSDK-0.0.1.gem

## Usage
```ruby
require "ConnectSdk"

api_key = "Connect API Key"
api_secret = "Connect API Secret"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
search_results = connectSdk
	.search().images()
	.with_phrase("gorilla")
	.with_page(2)
	.with_page_size(5)
	.execute()
    
search_results["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/ConnectSDK/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
