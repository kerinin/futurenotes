Feature: Create new notes
  @active
  Scenario: Load new
    Given I am on '/notes/new'
    Then I should see '#title'
    And I should see '#description'
    And I should see '#new_tag'
    And I should see '#tags'
    And I should see '#tag_1'
    And I should see '#save'

  @active
  Scenario: Basic Input
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    When I press the button 'Create'
    Then I should be redirected to '/notes/4'
    And I should see the text 'Note was successfully created'
    
  @active
  Scenario: Input title without description
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note title' into 'Title'
    When I press the button 'Create'
    Then I should be redirected to '/notes/4'
    And I should see the text 'Note was successfully created'
      
  @active  
  Scenario: Input description without title
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note description' into 'Description'
    When I press the button 'Create'
    Then I should be redirected to '/notes'
    And I should see the text 'Title can't be blank'
    
  @pending
  Scenario: Basic input with existing tag
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I click 'Tag 1'
    When I press the button 'Create'
    Then I should be redirected to '/notes/4'
    And I should see the text 'Note was successfully created'
    And note id=1 should have tag id=1
    
  @pending
  Scenario: Basic input with new tag
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'random tag' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to '/notes/4'
    And I should see the text 'Note was successfully created'
    And note id=1 should have tag id=4
    
  @pending
  Scenario: Basic input with existing tag (via input field)
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'Tag 1' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to '/notes/4'
    And I should see the text 'Note was successfully created'
    And note id=1 should have tag id=1
    
  @pending
  Scenario: Basic input with new tag (with same slug as existing)
    Given I have authenticated from '/'
    And I am on '/notes/new'
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'tag 1' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to '/notes/4'
    And I should see the text 'Note was successfully created'
    And note id=1 should have tag id=4