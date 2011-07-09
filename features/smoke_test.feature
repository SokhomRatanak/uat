@smoketest
Feature: Check default settings of website against specifications
In order to ensure the specifications
Visitors should be able to use the website as expected

  Scenario Outline: The Sitemap on the website covers all pages
    Given I am on "sitemap" 
    Then I should see "<page>"
    
  Examples:
    | page |
    | Start |

  Scenario: External pages show expected content
    Given I am on homepage
    Then I should see "dkd" within "#footer"

  Scenario: All pages are translated
    Given I am on "sitemap"
    Then I should not see "[Translate to"

  Scenario: Visit Search
    Given I am on "search"
    When I fill in "tx_indexedsearch[sword]" with "Test"
    And I press "Suche" within ".tx-indexedsearch-searchbox"
    Then I should see "Anzeige der Ergebnisse"
    
  Scenario: When I finished my workshop I get me a beer
  	Given I am a developer
  	And I am thirty
  	Then I should see a bar
  