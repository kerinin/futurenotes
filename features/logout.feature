Feature: Log out
  @active
  Scenario: Successful logout from /
    Given I am on '/'
    And I click 'Login'
    And I login as valid user 'Alice'
    When I click 'Logout'
    Then I should be redirected to '/'
    And I should see the text 'Login'