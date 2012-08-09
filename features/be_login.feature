Feature: Login as a backend user
In order to access backend

  Background: I log into the backend
    Given I am on backend-login
    And I fill in "t3-username" with "admin"
    And I fill in "t3-password" with "password"
    And I press "Login"
    Then I should not see "Your login attempt did not succeed"

  Scenario Outline: Web modules are available
    When I follow "<module>" within "ul#typo3-menu"
    Then I should see "New TYPO3 site" within "div#typo3-pagetree-tree"

    Examples:
      | module     |
      | Page       |
      | View       |
      | List       |
      | Workspaces |
      | Info       |
      | Access     |
      | Functions  |
      | Template   |
      | News Admin |

  Scenario: Context menu is working
    When I follow "Page" within "ul#typo3-menu"
    And I click on element "span#ext-gen139"
    And I wait for 2 seconds
    Then I should see "History/Undo" within "div#typo3-pagetree-contextmenu"
    And I take a screenshot

  Scenario: Content elements are available
    Given PENDING
    When I follow "Page" within "li#web_layout"
    And I follow "Welcome to TYPO3" within "div#typo3-pagetree-tree"
    Then I should have "1 iframe" within "div#typo3-contentContainer"
    # Then I take a screenshot
    Then I should see "Path: /Home/"
    # Then I take a screenshot
    And I should see "We also offer a demo of the"

