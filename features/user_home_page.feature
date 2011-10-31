Feature: User home page
  @active
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
    Given I have authenticated from the home page
    And I am on the user home page
    When I click 'Edit' from inside '#note_1'
    Then I should be redirected to edit note 1
    
  @active
  Scenario: Edit note from homepage
    Given I have authenticated from the home page
    And I am on the user home page
    And I click 'Edit' from inside '#note_1'
    And I type 'edited note title' into 'Title'
    And I type 'edited note description' into 'Description'
    And I check "Tag 3"
    When I press the button 'Update'
    Then I should be redirected to the user home page
    And I should see the text 'edited note title' under '#note_1'
    And I should see the text 'edited note description' under '#note_1'
    And I should see the text 'Tag 3' under '#note_1'
    And I should see the text 'Note was successfully updated'
  
  @active @pending
  Scenario: Delete note from user homepage
    Given I have authenticated from the home page
    And I am on the user home page
    When I click 'Delete' from inside '#note_1'
    #And I confirm  <-- test w/ javascript
    Then I should be redirected to the user home page
    And I should not see '#note_1'
  
  @active
  Scenario: No filter
    Given I have authenticated from the home page
    When I am on the user home page
    Then I should see '#note_1'
    And I should see '#note_2'
    And I should see '#note_3'
    And I should see '#note_4'
    
  @active
  Scenario: Filter history by tag
    Given I have authenticated from the home page
    And I am on the user home page
    When I click 'Tag 1' from inside '#filter > #by_tag'
    Then I should be redirected to the user home page
    And I should see '#note_1'
    And I should not see '#note_2'
    And I should not see '#note_3'
    And I should see '#note_4'
  
  @pending
  Scenario: Filter history by search
    Given I have authenticated from the home page
    And I am on the user home page
    When I type 'foobar' into 'Filter Notes'
    And I press enter
    Then I should be redirected to the user page
    And I should see '#note_1'
    And I should not see '#note_2'
    And I should see '#note_3'
    And I should see '#note_4'