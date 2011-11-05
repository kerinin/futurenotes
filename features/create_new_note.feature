Feature: Create new notes
  @to_screenshot
  Scenario: Load new
    Given I am on the new note page
    Then I should see '#title'
    And I should see '#description'
    And I should see '#scope'
    And I should see '#new_tag'
    And I should see '#tags'
    And I should see '#tag_1'
    And I should see '#save'
    
    And I should see '#description input[type=textarea]'
    And I should see the text 'Private' under '#scope'
    And I should see the text 'Public' under '#scope'
    And I should see '#scope input[type=radio]'

  @current
  Scenario: Basic Input
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title asdlfkjasd;fhasd;fhasdlkfja;sdhf;lasdhflasjdfl;kjasdkjfhasdlkfjasldfkjsdlfkjasdfljasdlf;hasdfhasldkjflkasdjfds asdlfkj al;sdf alsdkj fladkjf asd lkasdjfl; ksadjf' into 'Title'
    And I type 'new note description asldkfj alskdjf laskdj flkasjd lasdj lfjasdlf alk dsflkasdj flkj asdlfj lasfj lasdj flkadjs flksajd fljs adlfkj sdalkfj asdlfj laskj flkjs dflkjsdlfkj dsflkj lksdj fl' into 'Description'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    
  @active
  Scenario: Input title without description
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
      
  @active  
  Scenario: Input description without title
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note description' into 'Description'
    When I press the button 'Create'
    Then I should be redirected to the notes page
    And I should see the text "Title can't be blank"
    
  @active
  Scenario: Basic input with existing tag
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I check "Tag 1"
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'Tag 1' under '#tags'
    
  @active
  Scenario: Basic input with new tag
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'random tag' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'random tag' under '#tags'
    
  @pending
  Scenario: Unregistered user
  
    