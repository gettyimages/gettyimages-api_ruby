# Connect SDK by Getty Images.
# Provides an interface to Getty Images connect api.
# 
# The goal of the SDK is to simplify credential management and provide a reusable library
# for developers.

require_relative "Credentials"
require_relative "SearchRequest"
require_relative "ImagesRequest"
require_relative "DownloadRequest"

# ConnectSDK
# Provides a code api for interacting with getty rest services.
# {https://connect.gettyimages.com/swagger/ui/index.html Connect Getty Images API}

class ConnectSdk
	
	# Initialize the Credentials to be used by the SDK
	def initialize(api_key, api_secret, user_name = nil, password = nil)

		@credentials = Credentials.new(
			:credential_type => (user_name.nil?) || (password.nil?) ? OAuthGrantType::CLIENT_CREDENTIALS : OAuthGrantType::PASSWORD, 
			:client_key => api_key, 
			:client_secret => api_secret,
			:user_name => user_name,
			:password => password)				
	end

	# Get access token to be used by the SDK
	def get_access_token
		return @credentials.get_access_token
	end

	# Create a search configuration that support image searching
	# SearchRequest configured for a image search	
	def search()
		return SearchRequest.new(@credentials.client_key, @credentials.get_access_token)
	end

	# Create a image details configuration that support image details 
	# == Returns:
	# ImagesRequest configured for a image details	
	def images()
		return ImagesRequest.new(@credentials.client_key, @credentials.get_access_token)
	end
	
	def download
		return DownloadRequest.new(@credentials.client_key, @credentials.get_access_token)
	end

end

