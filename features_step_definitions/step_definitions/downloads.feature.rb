require 'test/unit'
require 'ConnectSDK'
require_relative 'credentials'

$download_scenario_context = Hash.new

Given(/^I have an apikey$/) do
	$download_scenario_context["api_key"] = Connect_Mashery_Credentials::API_KEY
end

Given(/^an apisecret$/) do
	$download_scenario_context["api_secret"] = Connect_Mashery_Credentials::API_SECRET	
end

Given(/^a username$/) do
  	$download_scenario_context["username"] = Connect_Mashery_Credentials::USERNAME
end

Given(/^a password$/) do
  	$download_scenario_context["password"] = Connect_Mashery_Credentials::PASSWORD
end

When(/^I request for any image to be downloaded$/) do
	begin
		connectSDK = ConnectSdk.new(
			$download_scenario_context["api_key"], 
			$download_scenario_context["api_secret"],
			$download_scenario_context["username"],
			$download_scenario_context["password"])
		$download_scenario_context["downloadUri"] = connectSDK.download().with_id("88510959").execute()
	rescue StandardError => e
		$download_scenario_context["StandardError"] = e
	end
end

Then(/^the url for the image is returned$/) do
  	assert(!$download_scenario_context["downloadUri"].nil?, "should expect download uri")   
end

Then(/^I receive an error$/) do
  	assert(!$download_scenario_context["StandardError"].nil?, "should expect error")   
end