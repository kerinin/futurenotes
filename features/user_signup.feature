Feature: Sign up new users
  @active
  Scenario: Click from home page
    Given I am on the home page
    When I click 'Get Started'
    Then I should be redirected to the new user page
  
  @active
  Scenario: Click 'login' from about page
    Given I am on the about page
    When I click 'Login'
    Then I should be redirected to the sign-in page
    
  @active
  Scenario: Click 'Add note' from home page
    Given I am on the home page
    When I click 'Add Note'
    Then I should be redirected to the sign-in page
    And I should see the text 'Sign up'
  
  @pending
  Scenario: Respond to invite