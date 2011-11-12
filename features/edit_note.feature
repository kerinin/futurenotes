Feature: Edit note
  @active
  Scenario: Edit my note
    Given a test note for the current user
    And I have authenticated from the home page
    When I click 'Edit'
    Then I should be redirected to the test note edit page
  
  @active
  Scenario: Edit someone else's note
    Given a test note for the current user
    And I am on the sign-in page
    And I login as valid user 'Alice'
    When I am on the test note edit page
    Then I should be redirected to the user home page
    And I should see the text 'You are not authorized to access this page.'
  
  @active
  Scenario: Delete my note
    Given I have authenticated from the home page
    When I click 'Delete'
    Then I should be redirected to the user home page
    And I should see the text 'Note was deleted.'
    
