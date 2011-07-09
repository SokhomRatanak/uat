@smoketest
Feature: Login as a backend user
In order to access backend

  Scenario: Login in as admin user
    Given I am on backend-login
    And I fill in "t3-username" with "admin"
    And I fill in "t3-password" with "t3dd11"
    And I press "Login"
#    And I wait until ".typo3-alt-intro-php-sub" is visible
    Then I should see "admin"

