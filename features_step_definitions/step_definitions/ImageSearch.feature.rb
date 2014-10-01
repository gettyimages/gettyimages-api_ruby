require 'test/unit'
require 'ConnectSDK'
require_relative 'credentials'

$scenario_context = Hash.new

Given(/^I have an apikey$/) do
	$scenario_context["api_key"] = Connect_Mashery_Credentials::API_KEY
end

Given(/^an apisecret$/) do
	$scenario_context["api_secret"] = Connect_Mashery_Credentials::API_SECRET
	$scenario_context["connectSdk"] = ConnectSdk.new($scenario_context["api_key"], $scenario_context["api_secret"])
end

When(/^I configure my search for blended images$/) do
  	$scenario_context["search"] = $scenario_context["connectSdk"].search().images()
end

When(/^I configure my search for creative images$/) do
	$scenario_context["search"] = $scenario_context["connectSdk"].search().images().creative()
end

When(/^I configure my search for editorial images$/) do
	$scenario_context["search"] = $scenario_context["connectSdk"].search().images().editorial()
end

When(/^I specify that I only want to return (.*) with my search results$/) do | response_field |
  	$scenario_context["search"].with_response_field(response_field)
end

When(/^I search for dog$/) do
	$scenario_context["search_results"] = $scenario_context["search"].with_phrase("dog").execute()
end

When(/^I specify (.*) editorial segment$/) do | editorial_segment |
  $scenario_context["search"].with_editorial_segments(editorial_segment)
end

When(/^I search for All Vocabulary$/) do
  # do nothing
end

When(/^I search for all vocabulary$/) do
  # do nothing
end

When(/^I specify a graphical (.*)$/) do | graphical_styles |
  $scenario_context["search"].with_graphical_styles(graphical_styles.downcase)  
end

When(/^I specify I want only embeddable images$/) do
  $scenario_context["search"].with_embed_content_only()
end

When(/^I specify I want to exclude images containing nudity$/) do
  $scenario_context["search"].with_exclude_nudity()
end

When(/^I specify a license model (.*)$/) do | license_models |
  $scenario_context["search"].with_license_models(license_models.downcase)
end

When(/^I specify an orientation (.*)$/) do | orientations |
  $scenario_context["search"].with_orientations(orientations.downcase)
end

Then(/^I get a response back that has my images$/) do
  	assert(!$scenario_context["search_results"].nil?, "should expect seach results")   
  	assert($scenario_context["search_results"]["result_count"] > 0, "should have at least one image") 
end

Then(/^only required return fields plus (.*) are returned$/) do | response_field |
  	assert(!$scenario_context["search_results"]["images"][0][response_field].nil?, "should expect search results") 	
end
