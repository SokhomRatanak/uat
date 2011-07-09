@smoketest
Feature: Login as a frontend user
In order to see special pages restricted for anonymous visitors
As a registered user I should be able to see content other visitors may not see
As a user "customer1" I want to have access to all protected content on the default site.
As a user "someone" I want to have access to the 'Any login page' only.

  Scenario: Verify that I'm on the login page
    Given I am on homepage
    And I follow "Customer login" within "#topMenu"
    Then I should see "Login to this website"

  Scenario Outline: Verify that login with wrong credentials is not possible
    Given I am on customer-login
    And I fill in "Username:" with "<username>"
    And I fill in "Password:" with "<password>"
    And I press "Login"
    Then I should see "Login failure"
    
    Examples:
      | username     |  password        |
      | customer1    |  wrong_password  |
      | customer2    |  wrong_password  |
      | someone      |  wrong_password  |
      | someone_else |  wrong_password  |
