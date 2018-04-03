require "pp"
require_relative "GettyImagesApi"

api_key = "api key"
api_secret = "api secret"

apiClient 		= GettyImagesApi.new(api_key, api_secret)
search_results	= apiClient.search().images().creative()
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


