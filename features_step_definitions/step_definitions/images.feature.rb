require 'test/unit'
require "ConnectSDK"

$images_scenario_context = Hash.new

Given(/^I have an apikey$/) do
	$images_scenario_context["api_key"] = "3z7q8fyw8ach5kr3mg35dkqz"	
end

Given(/^an apisecret$/) do
	$images_scenario_context["api_secret"] = "kYksrEH4Vyn6txeT5tFDJjxsdVYqS6usNDupa3aYWpwkr"	
end

Given(/^a username$/) do
  	$images_scenario_context["username"] = "rod.santos@gettyimages.com"
end

Given(/^a password$/) do
  	$images_scenario_context["password"] = "Fc7yejdTAIpfVBX"
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