Feature: Header
  @active
  Scenario: Clicking logo
    Given I am on the tos page
    When I click 'FutureNotes'
    Then I should be redirected to the home page
    
  @active
  Scenario: Clicking logo after login
    Given I have authenticated from the home page
    And I am on the user home page
    When I click 'FutureNotes'
    Then I should be redirected to the user home page
  
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
    
  @deprecated
  Scenario: Click my notes
    Given I have authenticated from the home page
    And I am on the home page
    When I click 'My Notes'
    Then I should be redirected to the user home page
    
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
    
  @active
  Scenario: Search from header
    Given I am on the about page
    When I type 'Note 1' into 'Search for:'
    And I press the button 'Search'
    Then I should be redirected to the search page
    And I should see the text "Search results for 'Note 1'"
