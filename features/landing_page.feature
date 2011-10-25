Feature: Landing Page
  @active
  Scenario: Load Landing Page (search root)
    When I load '/'
    Then I should see '#search_bar'
    And I should see '#common_tags'
    And I should see '#add_note'
    And I should see '#tos'
    
  @active
  Scenario: Click login
    Given I am on '/'
    When I click 'Login'
    Then I should be redirected to '/users/sign_in'
    
  @active
  Scenario: Click add
    Given I am on '/'
    When I click 'Add Note'
    Then I should be redirected to '/notes/new'
  
  @active
  Scenario: Search for term
    Given I am on '/'
    When I type 'search_text' into 'Search for:'
    And I press the button 'Search'
    Then I should be redirected to '/search'
    And I should see the text 'search_text'
  
  @active
  Scenario: Click tag from list
    Given I am on '/'
    When I click 'Tag 1'
    Then I should be redirected to '/tags/1'
  
  @active
  Scenario: Click about
    Given I am on '/'
    When I click 'About'
    Then I should be redirected to '/about'
    