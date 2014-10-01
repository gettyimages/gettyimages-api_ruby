require_relative "SearchImages"

class SearchRequest

	def initialize(api_key, token)
		@api_key = api_key
		@token = token
	end	
	
	public
	def images()
		return SearchImages.new(@api_key, @token)
	end

end