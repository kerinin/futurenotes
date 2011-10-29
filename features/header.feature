Feature: Header
  @active
  Scenario: Clicking logo
    Given I am on note page 1
    When I click 'FutureNotes'
    Then I should be redirected to the home page
  
  @active
  Scenario: Click login
    Given I am on the home page
    When I click 'Login'
    Then I should be redirected to the sign-in page
    
  @active
  Scenario: Click add
    Given I am on the home page
    When I click 'Add Note'
    Then I should be redirected to the new note page
    
  @active
  Scenario: Click about
    Given I am on the home page
    When I click 'About'
    Then I should be redirected to the about page
    
  @active
  Scenario: Successful logout from /
    Given I am on the home page
    And I click 'Login'
    And I login as valid user 'Alice'
    When I click 'Logout'
    Then I should be redirected to the home page
    And I should see the text 'Login'