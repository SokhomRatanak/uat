@smoketest
Feature: Check default settings of website against specifications
In order to ensure the specifications
Visitors should be able to use the website as expected

  Scenario: Verify that I'm on the introduction package
    Given I am on homepage
    Then I should see "Introduction Package" within "#header h1 a"

  Scenario: Verify that the search is working
    Given I am on homepage
    And I fill in "tx_indexedsearch[sword]" with "examples"
    And I press "Search" within "#searchBox"
    Then I should see "Search for" within ".tx-indexedsearch-whatis"
    And I should see "examples" within ".tx-indexedsearch-sw"
    And I should see "Displaying results 1 to" within ".tx-indexedsearch-browsebox"

  Scenario Outline: The Sitemap on the website covers all pages
    Given I am on sitemap
    Then I should see "<page>"
    
    Examples:
      | page        |
      | Get Started |
      | Examples    |
      | Feedback    |
