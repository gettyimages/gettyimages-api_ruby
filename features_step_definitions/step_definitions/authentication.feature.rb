require 'test/unit'
require 'ConnectSDK'
require_relative 'credentials'

$authentication_scenario_context = Hash.new

Given(/^I have an apikey$/) do
  $authentication_scenario_context["api_key"] = Connect_Mashery_Credentials::API_KEY
end

Given(/^an apisecret$/) do
  $authentication_scenario_context["api_secret"] = Connect_Mashery_Credentials::API_SECRET
end

Given(/^a username$/) do
  $authentication_scenario_context["username"] = Connect_Mashery_Credentials::USERNAME
end

Given(/^a password$/) do
  $authentication_scenario_context["password"] = Connect_Mashery_Credentials::PASSWORD
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
