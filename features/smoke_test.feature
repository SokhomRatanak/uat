@smoketest
Feature: Check default settings of website against specifications
In order to ensure the specifications
Visitors should be able to use the website as expected

  Scenario: Verify that I'm on the introduction package
    Given I am on homepage
    Then I should see "Congratulations" within "h1"

  Scenario Outline: The Sitemap on the website covers all pages
    Given I am on sitemap
    Then I should see "<page>"
    
  Examples:
    | Get Started |
    | Examples |
    | Feedback |

