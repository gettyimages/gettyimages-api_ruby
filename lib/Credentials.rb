require 'open-uri'
require 'net/https'

class OAuthGrantType
 	PASSWORD = 'password'
 	CLIENT_CREDENTIALS = 'client_credentials'
end

class Credentials

	attr_accessor :credential_type
	attr_accessor :client_key
	attr_accessor :client_secret
	attr_accessor :user_name
	attr_accessor :password
	attr_accessor :token_details

	def initialize(args)
		args.keys.each { |name| instance_variable_set "@" + name.to_s, args[name] }	
		@token_details = nil
	end

	def get_uri(path)
		return URI.parse "#{Api_Host::API_BASE_URL}#{path}"
	end

	def token_has_expired()
		if (!token_details.nil?) && (@token_details.has_key?("sdk_expire_time"))
			return @token_details["sdk_expire_time"] < (Time.now - 300)
		end
		return true
	end

	# Get Access Token Using OAuth
	def get_access_token
		
		if (!token_has_expired())
			return @token_details["access_token"]
		end
		
		# Determine OAuth Flow
		case @credential_type
			when OAuthGrantType::PASSWORD
				oauth_data = {
					:grant_type => @credential_type, 
					:client_id => @client_key, 
					:client_secret => @client_secret, 
					:username => @user_name, 
					:password => @password }
			when OAuthGrantType::CLIENT_CREDENTIALS
				oauth_data = {
					:grant_type => @credential_type, 
					:client_id => @client_key, 
					:client_secret => @client_secret }
			else
				puts 'Current OAuth flow only supports Resource Owner and Client Credentials'				
		end

		# define endpoint
		uri = get_uri '/oauth2/token'

		# define HTTPS connection
		https = Net::HTTP.new(uri.host, uri.port)
		https.use_ssl = true
		https.verify_mode = OpenSSL::SSL::VERIFY_NONE
		
		# define Request
		req = Net::HTTP::Post.new uri.request_uri
		req['Api-Key'] = @client_key
		req.set_form_data oauth_data
		
		res = https.request req
		data = res.body
		result = JSON.parse(data)
		if !res.is_a?(Net::HTTPSuccess)
			raise res.code + ": " + result['error_description']	
		end

		@token_details = result
		expiry = token_details["expires_in"].to_i
		@token_details["sdk_expire_time"] = Time.now + expiry

		return result['access_token']
	end

end