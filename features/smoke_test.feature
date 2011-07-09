@smoketest
Feature: Check default settings of website against specifications
In order to ensure the specifications
Visitors should be able to use the website as expected

#  Scenario: Verify that I'm on the introduction package
#    Given I am on homepage
#    Then I should see "Introduction Package" within "h1"

  Scenario: Verify search results for TYPO3 gives 34 results
    Given I am on homepage
    When I fill in "inputText" with "typo3"
    And I press "inputButton"
    Then I should see "34" within ".tx-indexedsearch-browsebox"


