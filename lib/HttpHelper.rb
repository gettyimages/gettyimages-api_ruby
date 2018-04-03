require 'net/http'
require 'uri'
require 'json'
require 'rbconfig'
require_relative 'GettyImagesApi/version'

class Api_Host
	API_HOST = "api.gettyimages.com"
	API_BASE_URL = "https://#{API_HOST}"
end

class HttpHelper

	def initialize(api_key, access_token)
		@api_key = api_key
		@access_token = access_token
	end	

	def get_uri(path)
		return URI.parse "#{Api_Host::API_BASE_URL}#{path}"
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

	def post(endpoint_path, query_params, body)

		uri = get_uri(endpoint_path)
		if !query_params.nil?
			uri.query = URI.encode_www_form query_params
		end	
		req = Net::HTTP::Post.new uri.request_uri
		if !body.nil?
			req["Content-Type"] = "application/json"
			req.body = body.to_json
		end
		return send uri, req, @api_key, @access_token

	end

	def put(endpoint_path, query_params, body)

		uri = get_uri(endpoint_path)
		if !query_params.nil?
			uri.query = URI.encode_www_form query_params
		end	
		req = Net::HTTP::Put.new uri.request_uri
		if !body.nil?
			req["Content-Type"] = "application/json"
			req.body = body.to_json
		end
		return send uri, req, @api_key, @access_token

	end

	def delete(endpoint_path, query_params)

		uri = get_uri(endpoint_path)
		if !query_params.nil?
			uri.query = URI.encode_www_form query_params
		end	
		req = Net::HTTP::Delete.new uri.request_uri
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
	def send(uri, request, api_key, bearer_token = "")

		# define HTTPS connection
		https = Net::HTTP.new(uri.host, uri.port)
		https.use_ssl = true
		https.verify_mode = OpenSSL::SSL::VERIFY_NONE

		# define headers
		request["User-Agent"] = "GettImagesApiSdk/#{GettyImagesApi::VERSION} (#{os} ; Ruby #{RUBY_VERSION})"
		request["Api-Key"] = api_key
		request["Authorization"] = "Bearer #{bearer_token}" unless bearer_token.empty?
		
		# send request		
		resp = https.request request

		if !resp.is_a?(Net::HTTPSuccess)
			data = JSON.parse(resp.body)			
			raise "HTTP RESPONSE: #{data}" 
		end

		if resp.code == '204'
			return Hash.new
		end

		return JSON.parse(resp.body)

	end 

end