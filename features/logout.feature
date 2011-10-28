Feature: Log out
  @active
  Scenario: Successful logout from /
    Given I am on the home page
    And I click 'Login'
    And I login as valid user 'Alice'
    When I click 'Logout'
    Then I should be redirected to the home page
    And I should see the text 'Login'