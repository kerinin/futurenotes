Feature: Landing Page
  @active
  Scenario: Load Landing Page (search root)
    When I am on the home page
    Then I should see '#search_bar'
    And I should see '#common_tags'
    And I should see '#add_note'
    And I should see '#tos'
  
  @active
  Scenario: Search for term
    Given I am on the home page
    When I type 'search_text' into 'Search for:'
    And I press the button 'Search'
    Then I should be redirected to the search results page
    And I should see the text 'search_text'
  
  @current
  Scenario: Click tag from list
    Given a test tag named 'Test Tag'
    And I am on the home page
    When I click 'Test Tag'
    Then I should be redirected to the test tag page
  
    