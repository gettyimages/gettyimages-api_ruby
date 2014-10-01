require 'test/unit'
require 'ConnectSDK'
require_relative 'credentials'

$images_scenario_context = Hash.new

Given(/^I have an apikey$/) do
	$images_scenario_context["api_key"] = Connect_Mashery_Credentials::API_KEY
end

Given(/^an apisecret$/) do
	$images_scenario_context["api_secret"] = Connect_Mashery_Credentials::API_SECRET
end

Given(/^a username$/) do
  	$images_scenario_context["username"] = Connect_Mashery_Credentials::USERNAME
end

Given(/^a password$/) do
  	$images_scenario_context["password"] = Connect_Mashery_Credentials::PASSWORD
end

Given(/^I have an image id I want details on$/) do
	
	connectSdk = ConnectSdk.new(
			$images_scenario_context["api_key"], 
			$images_scenario_context["api_secret"],
			$images_scenario_context["username"],
			$images_scenario_context["password"])	
	$images_scenario_context["images"] = connectSdk.images().with_ids(["488898399", "88510959"])	
end

Given(/^I specify field caption$/) do
  $images_scenario_context["images"].with_response_field("caption")
end

Given(/^I specify field title$/) do
  $images_scenario_context["images"].with_response_field("title")
end

When(/^I retrieve image details$/) do
  $images_scenario_context["results"] = $images_scenario_context["images"].execute()
end

Then(/^I get a response back that has my image details$/) do
	assert(!$images_scenario_context["results"]["images"].nil?, "should expect image results")
end

Then(/^the response contains caption$/) do
	assert(!$images_scenario_context["results"]["images"][0]["caption"].nil?, "should expect caption in results")
end

Then(/^the response contains title$/) do
  	assert(!$images_scenario_context["results"]["images"][0]["title"].nil?, "should expect title in results")
end