require "pp"
require "ConnectSdk"

api_key = "3z7q8fyw8ach5kr3mg35dkqz"
api_secret = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"
user_name = "rod.santos@gettyimages.com"
password = "Fc7yejdTAIpfVBX"

# create instance of the Connect SDK
connectSdk = ConnectSdk.new(api_key, api_secret, user_name, password)
downloadUri = connectSdk.download().with_id("88510959").execute()
puts downloadUri
		