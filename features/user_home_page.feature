Feature: User home page
  @deprecated
  Scenario: Add note from user homepage
    Given I have authenticated from the home page
    And I am on the user home page
    When I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'new note title' under '#user_notes'
  
  @active
  Scenario: Click to edit note from user homepage
    Given a test note for the current user
    And I have authenticated from the home page
    And I am on the user home page
    When I click 'Edit' from inside '.note'
    Then I should be redirected to the test note edit page
    
  @active
  Scenario: Edit note from homepage
    Given a test note for the current user
    And I have authenticated from the home page
    And I am on the user home page
    And I click 'Edit' from inside '.note'
    And I type 'edited note title' into 'Title'
    And I type 'edited note description' into 'Description'
    And I check "Tag 3"
    When I press the button 'Update'
    Then I should be redirected to the user home page
    And I should see the text 'edited note title' under '.note'
    And I should see the text 'edited note description' under '.note'
    And I should see the text 'Tag 3' under '.note'
    And I should see the text 'Note was successfully updated'
  
  @active @pending
  Scenario: Delete note from user homepage
    Given a test note for the current user with title 'to be deleted'
    And I have authenticated from the home page
    And I am on the user home page
    When I click 'Delete' from inside '.note'
    #And I confirm  <-- test w/ javascript
    Then I should be redirected to the user home page
    And I should not see the text 'to be deleted'
  
  @active
  Scenario: No filter
    Given I have authenticated from the home page
    When I am on the user home page
    Then I should see the text 'Note 1 foobar'
    And I should see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    
  @active
  Scenario: Filter history by tag
    Given I have authenticated from the home page
    And I am on the user home page
    When I click 'Tag 1' from inside '#filter > #by_tag'
    Then I should be redirected to the user home page
    And I should see the text 'Note 1 foobar'
    And I should not see the text 'Note 2'
    And I should not see the text 'Note 3'
    And I should see the text 'Note 4'
  
  @pending
  Scenario: Filter history by search
    Given I have authenticated from the home page
    And I am on the user home page
    When I type 'foobar' into 'Filter Notes'
    And I press enter
    Then I should be redirected to the user page
    And I should see the text 'Note 1 foobar'
    And I should not see the text 'Note 2'
    And I should see the text 'Note 3'
    And I should see the text 'Note 4'
    
  @active
  Scenario: Try to view someone else's home page
    Given a test user with password 'easy_password'
    And I have authenticated from the home page
    When I am on the test user home page
    Then I should be redirected to the user home page