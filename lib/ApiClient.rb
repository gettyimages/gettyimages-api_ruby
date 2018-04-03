require_relative "Credentials"
require_relative "Search/SearchImages.rb"
require_relative "Search/SearchImagesCreative.rb"
require_relative "Search/SearchImagesEditorial.rb"
require_relative "Search/SearchVideos.rb"
require_relative "Search/SearchVideosCreative.rb"
require_relative "Search/SearchVideosEditorial.rb"
require_relative "Downloads/DownloadImages.rb"
require_relative "Downloads/DownloadVideos.rb"
require_relative "Images/Images.rb"
require_relative "Videos/Videos.rb"
require_relative "CustomRequest/CustomRequest.rb"

class ApiClient
	
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

	# Search for both creative and editorial images
	def search_images()
		return SearchImages.new(@credentials.client_key, @credentials.get_access_token)
	end

	# Search for creative images
	def search_images_creative()
		return SearchImagesCreative.new(@credentials.client_key, @credentials.get_access_token)
	end

	# Search for editorial images
	def search_images_editorial()
		return SearchImagesEditorial.new(@credentials.client_key, @credentials.get_access_token)
	end

	#Search for both creative and editorial videos
	def search_videos()
		return SearchVideos.new(@credentials.client_key, @credentials.get_access_token)
	end

	#Search for creative videos
	def search_videos_creative()
		return SearchVideosCreative.new(@credentials.client_key, @credentials.get_access_token)
	end

	#Search for editorial videos
	def search_videos_editorial()
		return SearchVideosEditorial.new(@credentials.client_key, @credentials.get_access_token)
	end
	
	#Get metadata for images 	
	def images()
		return Images.new(@credentials.client_key, @credentials.get_access_token)
	end

	#Get metadata for videos 	
	def videos()
		return Videos.new(@credentials.client_key, @credentials.get_access_token)
	end
	
	#Download an image
	def download_images()
		return DownloadImages.new(@credentials.client_key, @credentials.get_access_token)
	end

	#Download a video
	def download_videos()
		return DownloadVideos.new(@credentials.client_key, @credentials.get_access_token)
	end

	#Build a custom API request
	def custom_request()
		return CustomRequest.new(@credentials.client_key, @credentials.get_access_token)
	end

end

