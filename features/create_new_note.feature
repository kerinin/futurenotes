Feature: Create new notes
  @active
  Scenario: Load new
    Given I am on the new note page
    Then I should see '#title'
    And I should see '#description'
    And I should see '#new_tag'
    And I should see '#tags'
    And I should see '#tag_1'
    And I should see '#save'

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
    
  @active
  Scenario: Delimited input with new tags
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'random tag, second random tag' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'random tag' under '#tags'
    And I should see the text 'second random tag' under '#tags'
    And I should see 2 elements kind of "#note_9 .tag"
      
  @active
  Scenario: Basic input with existing tag (via input field)
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'Tag 1' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'Tag 1' under '#tags'
    And I should see 1 elements kind of "#tag_1"

  @active
  Scenario: Delimited input with existing tag (via input field)
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'Tag 1, Tag 2' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'Tag 1' under '#tags'
    And I should see the text 'Tag 2' under '#tags'
    And I should see 2 elements kind of "#note_9 .tag"

  @active
  Scenario: Delimited input with alternate delimiter spacings
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'Tag 1, Tag 2,Tag 3,   tag 1  ,   tag 5 foobar' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see 5 elements kind of "#note_9 .tag"
              
  @active
  Scenario: Basic input with new tag (with different capitalization)
    Given I have authenticated from the home page
    And I am on the new note page
    And I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I type 'tAg 1' into 'New Tag'
    When I press the button 'Create'
    Then I should be redirected to the user home page
    And I should see the text 'Note was successfully created'
    And I should see the text 'tAg 1' under '#tags'
    And I should see 1 elements kind of "#tag_6"
    
  @current
  Scenario: Unregistered user
    