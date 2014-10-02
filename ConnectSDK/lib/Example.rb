require "pp"
require_relative "ConnectSDK"

api_key = "3z7q8fyw8ach5kr3mg35dkqz"
api_secret = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"

# Example of Connect SDK
connectSdk 		= ConnectSdk.new(api_key, api_secret)
search_results	= connectSdk.search().images().creative()
					.with_phrase("gorilla")
					.with_response_fields(["id","title"])
					.with_graphical_styles("illustration")
					.with_graphical_styles(["fine_art","photography"])
					.with_page(2)
					.with_page_size(5)
					.execute()

search_results["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end


