Feature: When creating a new note, automatically add the tags from the last note created
Reduces interface interaction, increases tag usage

  @active
  Scenario: From user home page
    Given I have authenticated from the home page
    And I am on the user home page
    When I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I check "Tag 1"
    And I check "Tag 2"
    And I uncheck "Tag 3"
    And I uncheck "tag 1"
    And I uncheck "tag 5 foobar"
    And I press the button 'Create'
    And I am on the user home page
    Then the "Tag 1" checkbox should be checked
    And the "Tag 2" checkbox should be checked
    And the "Tag 3" checkbox should not be checked
    And the "tag 1" checkbox should not be checked
    And the "tag 5 foobar" checkbox should not be checked
  
  @active
  Scenario: From new notes page
    Given I have authenticated from the home page
    And I am on the new note page
    When I type 'new note title' into 'Title'
    And I type 'new note description' into 'Description'
    And I check "Tag 1"
    And I check "Tag 2"
    And I uncheck "Tag 3"
    And I uncheck "tag 1"
    And I uncheck "tag 5 foobar"
    And I press the button 'Create'
    And I am on the new note page
    Then the "Tag 1" checkbox should be checked
    And the "Tag 2" checkbox should be checked
    And the "Tag 3" checkbox should not be checked
    And the "tag 1" checkbox should not be checked
    And the "tag 5 foobar" checkbox should not be checked

