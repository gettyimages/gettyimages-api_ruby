require "ConnectSdk"
require "pp"

api_key = "3z7q8fyw8ach5kr3mg35dkqz"
api_secret = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)

puts "Blended Search Results"
search_results = connectSdk.search().images()
	.with_phrase("gorilla")
	.with_response_fields(["comp","title","thumb"])
	.with_page(2)
	.with_page_size(5)
	.with_graphical_styles( ["illustration","photography"])
	.execute()

pp search_results

search_results["images"].each do | image |
	image["display_sizes"].each do | display_sizes |
		puts "Id: #{image["id"]} Title: #{image["title"]}" 	
		puts "	Display Size: #{display_sizes["name"]}" 	
		puts "	Uri: #{display_sizes["uri"]}" 	
	end
end

puts "Creative Search Results"
search_results = connectSdk.search().images().creative()
	.with_phrase("gorilla")
	.with_page(2)
	.with_page_size(5)
	.with_license_models(["rights_managed","royalty_free"])
	.with_response_fields(["id","title"])
	.with_graphical_styles( ["illustration","photography"])
	.execute()

search_results["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end

puts "Editorial Search Results"
search_results = connectSdk.search().images().editorial()
	.with_phrase("gorilla")
	.with_page(2)
	.with_page_size(5)
	.with_response_fields(["id","title"])
	.with_graphical_styles( ["illustration","photography"])
	.with_exclude_nudity()
	.with_embed_content_only()	
	.execute()

search_results["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end
