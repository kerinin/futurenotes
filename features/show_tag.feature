Feature: Search by Tag
  @to_screenshot
  Scenario: View tag#show
    Given I am on tag page 1
    Then I should see the text 'Tag 1'
    And I should see the text 'Note 1'
    And I should see the text 'Description 1' under '#public_notes'
    And I should see the text 'Tag 1' under '.note'
    And I should see the text 'Tag 2' under '.note'
    And I should not see the text 'Private Note 1'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 4'
        
  @pending
  Scenario: Click tag from the home page
    Given I am on the home page
    When I click 'Tag 1'
    Then I should be redirected to tag page 1
  
  @active
  Scenario: Click tag from note
    Given I am on note page 1
    When I click 'Tag 1'
    Then I should be redirected to tag page 1