@acceptance.FirstRelease
Feature: Downloads
  In order to serve image content on my site
  as a developer consuming the sdk
  I need to be able to download images

Scenario: Client Credentials
Given I have an apikey
And an apisecret
When I request for any image to be downloaded
Then I receive an error

Scenario: Resource Owner
Given I have an apikey
And an apisecret
And a username
And a password
When I request for any image to be downloaded
Then the url for the image is returned
