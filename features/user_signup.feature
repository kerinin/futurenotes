Feature: Sign up new users
  Scenario: Click 'register' from home page
    Given I am on the home page
    When I click 'Register'
    Then I should be redirected to the user registration page
  
  Scenario: Click 'register' from about page
    Given I am on the about page
    When I click 'Regiser'
    Then I should be redirected to the user registration page
  
  Scenario: Register from the registration page
  
  Scenario: Click 'Add note' from home page
  
  @pending
  Scenario: Respond to invite