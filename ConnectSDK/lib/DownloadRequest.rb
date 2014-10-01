require_relative 'HttpHelper'

class DownloadRequest

	attr_accessor :asset_id

	def initialize(api_key, access_token)

		self
		@api_key = api_key
		@access_token = access_token

		@http_helper = HttpHelper.new(api_key, access_token)		

	end	

	public 	
	def with_id(asset_id)	
		self.asset_id = asset_id
		return self
	end

	public
	def execute
		
		uri = '/v3/downloads/' + self.asset_id + '?auto_download=false'
		data = @http_helper.post(uri)			
	 	return data['uri']

	end

end