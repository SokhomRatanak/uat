Feature: Login as a backend user
In order to access backend

  Scenario: Login in as admin user
    Given I am on backend-login
    And I fill in "t3-username" with "admin"
    And I fill in "t3-password" with "password"
    And I press "Login"
    #Then I should see " Logout " within "div#logout-button"
    Then I should not see "Your login attempt did not succeed"
    And I should see "Logout"

