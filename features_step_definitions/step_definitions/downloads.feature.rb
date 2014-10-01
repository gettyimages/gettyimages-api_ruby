require 'test/unit'
require "ConnectSDK"

$download_scenario_context = Hash.new

Given(/^I have an apikey$/) do
	$download_scenario_context["api_key"] = "3z7q8fyw8ach5kr3mg35dkqz"	
end

Given(/^an apisecret$/) do
	$download_scenario_context["api_secret"] = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"	
end

Given(/^a username$/) do
  	$download_scenario_context["username"] = "rod.santos@gettyimages.com"
end

Given(/^a password$/) do
  	$download_scenario_context["password"] = "Fc7yejdTAIpfVBX"
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