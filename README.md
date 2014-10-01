# Getty Images Connect SDK 
Seamlessly integrate Getty Images' expansive digital content, powerful search technology, and rich metadata into your publishing tools, products and services!

- Search for images from our extensive creative and editorial catalogs.
- Get image metadata.
- Download files using your Getty Images products (e.g., Editorial subscriptions, Easy Access, Thinkstock Subscriptions, and Image Packs).

## Requirements
- Ruby version > 1.9.3
- [Bundler](http://bundler.io) version > 1.7.3

## Building/Installation Gem Package
**[NOTE: Currently not published to [rubygems.org](https://rubygems.org), install from local build package.]**

The following describes how to create the local gem package for ConnectSDK. The package will be created in the pkg folder in the source code location. 

	$ cd connect_sdk_ruby/ConnectSDK
	$ bundle exec rake install

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

## BDD Features
	
	$ bundle exec cucumber features\authentication.feature -r features_step_definitions\step_definitions\authentication.feature.rb
	$ bundle exec cucumber features\downloads.feature -r features_step_definitions\step_definitions\downloads.feature.rb
	$ bundle exec cucumber features\ImageSearch.feature -r features_step_definitions\step_definitions\ImageSearch.feature.rb
	$ bundle exec cucumber features\images.feature -r features_step_definitions\step_definitions\images.feature.rb

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ConnectSDK/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
