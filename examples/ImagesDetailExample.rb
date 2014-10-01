require "ConnectSdk"

api_key = "3z7q8fyw8ach5kr3mg35dkqz"
api_secret = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret)
images = connectSdk.images().with_ids(["488898399", "88510959"])
imageDetails = images.with_response_fields(["id","uri_oembed","title"]).execute()

imageDetails["images"].each do | image |
	puts "Id: #{image["id"]} Title: #{image["title"]}" 
end
