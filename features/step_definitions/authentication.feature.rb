require 'test/unit'
require "ConnectSDK"

$authentication_scenario_context = Hash.new

Given(/^I have an apikey$/) do
  $authentication_scenario_context["api_key"] = "3z7q8fyw8ach5kr3mg35dkqz"	
end

Given(/^an apisecret$/) do
  $authentication_scenario_context["api_secret"] = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"	
end

Given(/^a username$/) do
  $authentication_scenario_context["username"] = "rod.santos@gettyimages.com"
end

Given(/^a password$/) do
  $authentication_scenario_context["password"] = "Fc7yejdTAIpfVBX"
end

When(/^I ask the sdk for an authentication token$/) do
  	connectSDK = ConnectSdk.new(
			$authentication_scenario_context["api_key"], 
			$authentication_scenario_context["api_secret"],
			$authentication_scenario_context["username"],
			$authentication_scenario_context["password"])
	$authentication_scenario_context["access_token"] = connectSDK.get_access_token()
end

Then(/^a token is returned$/) do
  assert(!$authentication_scenario_context["access_token"].nil?, "should expect download uri")   
end
