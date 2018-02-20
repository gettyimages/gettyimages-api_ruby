@acceptance.FirstRelease
Feature: Search for Images
  To create a rockin website with sweet images
  As a developer that wants to expose images to resell
  I'd need to be able to find me some images with minimal effort

Scenario Outline: Finding images basic
  Given I have an apikey
  And an apisecret
  When I configure my search for <ImageFamily> images
  And I search for dog
  Then I get a response back that has my images
  Examples:
  | ImageFamily |
  | creative    | 
  | editorial   | 

Scenario Outline: Finding images advanced
  Given I have an apikey
  And an apisecret
  When I configure my search for <ImageFamily> images
  And I specify that I only want to return <Fields> with my search results
  And I search for dog
  Then I get a response back that has my images
  And only required return fields plus <Fields> are returned
  Examples:
  | ImageFamily | Fields       |
  | creative    | asset_family |
  | creative    | title        |
  | editorial   | asset_family |
  | editorial   | title        |

Scenario Outline: Search for images using editorial segments
Given I have an apikey
And an apisecret
When I configure my search for editorial images
And I specify <segment> editorial segment
And I search for All Vocabulary
Then I get a response back that has my images
Examples:
| segment       |
| Archival      |
| Entertainment |
| News          |
| Publicity     |
| Royalty       |
| Sport         |

Scenario Outline: Search for images with graphical styles
Given I have an apikey
And an apisecret
When I configure my search for <ImageFamily> images
And I specify a graphical <style>
And I search for all vocabulary
Then I get a response back that has my images
Examples:
| style        | ImageFamily |
| Fine_Art     | creative    |
| Photography  | creative    |
| Illustration | creative    |
| Photography  | editorial   |

Scenario: Search for images with multiple graphical styles
Given I have an apikey
And an apisecret
When I configure my search for creative images
And I specify a graphical Fine_Art
And I specify a graphical Photography
And I search for dog
Then I get a response back that has my images

Scenario: Search for embeddable images
Given I have an apikey
And an apisecret
When I configure my search for creative images
When I specify I want only embeddable images
And I search for dog
Then I get a response back that has my images

Scenario: Search for images excluding nudity
Given I have an apikey
And an apisecret
When I configure my search for creative images
And I specify I want to exclude images containing nudity
And I search for dog
Then I get a response back that has my images

Scenario Outline: Search for images specifying license model
Given I have an apikey
And an apisecret
When I configure my search for creative images
And I specify a license model <model>
And I search for dog
Then I get a response back that has my images
Examples:
| model          |
| Rights_Managed |
| Royalty_Free   |

Scenario Outline: Search for images specifying orientation
Given I have an apikey
And an apisecret
When I configure my search for <image family> images
And I specify an orientation <value>
And I search for dog
Then I get a response back that has my images
Examples:
| image family | value                |
| creative     | Horizontal           |
| creative     | Panoramic_Horizontal |
| creative     | Panoramic_Vertical   |
| creative     | Square               |
| creative     | Vertical             |
| editorial    | Horizontal           |
| editorial    | Panoramic_Horizontal |
| editorial    | Panoramic_Vertical   |
| editorial    | Square               |
| editorial    | Vertical             |
| blended      | Horizontal           |
| blended      | Panoramic_Horizontal |
| blended      | Panoramic_Vertical   |
| blended      | Square               |
| blended      | Vertical             |
