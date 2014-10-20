require 'net/http'
require 'uri'
require 'json'
require 'rbconfig'
require_relative 'ConnectSDK/version'

class Connect_Api_Host
	API_HOST = "connect.gettyimages.com"
	API_BASE_URL = "https://#{API_HOST}"
end

class HttpHelper

	def initialize(api_key, access_token)
		@api_key = api_key
		@access_token = access_token
	end	

	def get_uri(path)
		return URI.parse "#{Connect_Api_Host::API_BASE_URL}#{path}"
	end

	def get(endpoint_path, query_params)
		
		uri = get_uri(endpoint_path)
		#puts uri		
		if !query_params.nil?
			uri.query = URI.encode_www_form query_params
		end
		#puts "REQUEST URI: #{uri.request_uri}" 
		req = Net::HTTP::Get.new uri.request_uri
		return send uri, req, @api_key, @access_token

	end

	def post(endpoint_path)

		uri = get_uri endpoint_path	
		req = Net::HTTP::Post.new uri.request_uri
		return send uri, req, @api_key, @access_token

	end

	private
	def os
		@os ||= (
		host_os = RbConfig::CONFIG['host_os']
		case host_os
			when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
				:windows
			when /darwin|mac os/
				:macosx
			when /linux/
				:linux
			when /solaris|bsd/
				:unix
			else
				raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
			end)
  	end

	private
	def send(connect_uri, connect_request, api_key, bearer_token = "")

		# define HTTPS connection
		https = Net::HTTP.new(connect_uri.host, connect_uri.port)
		https.use_ssl = true
		https.verify_mode = OpenSSL::SSL::VERIFY_NONE

		# define headers
		connect_request["User-Agent"] = "ConnectSDK/#{ConnectSDK::VERSION} (#{os} ; Ruby #{RUBY_VERSION})"
		connect_request["Api-Key"] = api_key
		connect_request["Authorization"] = "Bearer #{bearer_token}" unless bearer_token.empty?

		
		# connect_request.each_header do |header_name, header_value|
 	 	#	puts "#{header_name} : #{header_value}"
		# end
		# https.set_debug_output $stderr
		
		# send request		
		resp = https.request connect_request
		# puts "HTTP RESPONSE: #{resp}" 

		 if !resp.is_a?(Net::HTTPSuccess)			
			raise "HTTP RESPONSE: #{resp}" 
		end

		return JSON.parse(resp.body)

	end 

end