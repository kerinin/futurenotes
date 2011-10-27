Feature: Search
  Scenario: Basic search
    Given I am on '/'
    When I enter 'foobar' into 'Search'
    And I click 'Go'
    Then I should be redirected to '/search'
    And I should see the text 'Search: foo'
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'
    
    
  Scenario: Non-delimited substring search
    Given I am on '/'
    When I enter 'foo' into 'Search'
    And I click 'Go'
    Then I should be redirected to '/search'
    And I should see the text 'Search: foo'
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'

  Scenario: Case-insensitive search
    Given I am on '/'
    When I enter 'FoObAr' into 'Search'
    And I click 'Go'
    Then I should be redirected to '/search'
    And I should see the text 'Search: foo'
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'
          
  Scenario: Basic authenticated search
    Given I have authenticated from '/'
    When I enter 'foobar' into 'Search'
    And I click 'Go'
    Then I should be redirected to '/search'
    And I should see the text 'Search: foo'
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should see the text 'Private Note 1' within '#user_notes'
    And I should not see the text 'Private Note 2' within '#user_notes'
    And I should see the text 'Private Note 3' within '#user_notes'
    And I should see the text 'Private Note 4' within '#user_notes'
    
  Scenario: Authenticated as other user search
    Given I am on '/'
    And I click 'Login'
    And I have authenticated as valid user 'Alice'
    And I am on '/'
    When I enter 'foobar' into 'Search'
    And I click 'Go'
    Then I should be redirected to '/search'
    And I should see the text 'Search: foo'
    And I should see the text 'Note 1'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 1'
    And I should not see the text 'Private Note 2'
    And I should not see the text 'Private Note 3'
    And I should not see the text 'Private Note 4'