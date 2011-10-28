Feature: Search
  @active
  Scenario: Basic search
    Given I am on the home page
    When I type 'foobar' into 'Search'
    And I press the button 'Search'
    Then I should be redirected to the search page
    # And show me the page
    And I should see the text "Search results for 'foobar'"
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'
    
  @future
  Scenario: Non-delimited substring search
    Given I am on the home page
    When I type 'foo' into 'Search'
    And I press the button 'Search'
    Then I should be redirected to the search page
    And I should see the text "Search results for 'foo'"
    And show me the page
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'

  @active
  Scenario: Case-insensitive search
    Given I am on the home page
    When I type 'FoObAr' into 'Search'
    And I press the button 'Search'
    Then I should be redirected to the search page
    And I should see the text "Search results for 'FoObAr'"
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'
          
  @active
  Scenario: Basic authenticated search
    Given I have authenticated from the home page
    And I am on the home page
    When I type 'foobar' into 'Search'
    And I press the button 'Search'
    Then I should be redirected to the search page
    And I should see the text "Search results for 'foobar'"
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should see the text 'Private Note 1' under '#user_notes'
    And I should not see the text 'Private Note 2' under '#user_notes'
    And I should see the text 'Private Note 3' under '#user_notes'
    And I should see the text 'Private Note 4' under '#user_notes'
    
  @active
  Scenario: Authenticated as other user search
    Given I am on the home page
    And I click 'Login'
    And I login as valid user 'Alice'
    And I am on the home page
    When I type 'foobar' into 'Search'
    And I press the button 'Search'
    Then I should be redirected to the search page
    And I should see the text "Search results for 'foobar'"
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'