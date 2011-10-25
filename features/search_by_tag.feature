Feature: Search by Tag
  @active
  Scenario: View tag#show
    Given I am on '/tags/1'
    Then I should see the text 'Tag 1'
    And I should see the text 'Note 1'
    And I should not see the text 'Private Note 1'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 4'
    
  @active
  Scenario: View tag#show with different spelling
    Given I am on '/tags/4'
    Then I should see the text 'tag 1'
    And I should see the text 'Note 1'
    And I should not see the text 'Private Note 1'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 4'
    
  @active
  Scenario: View tag#show as authenticated user
    Given I have authenticated from '/'
    When I load '/tags/1'
    Then I should see the text 'Tag 1'
    And I should see the text 'Note 1'
    And I should see the text 'Private Note 1'
    And I should see the text 'Note 4'
    And I should see the text 'Private Note 4'

  @active
  Scenario: View tag#show as another authenticated user
    Given I am on '/users/sign_in'
    And I login as valid user 'Alice'
    When I load '/tags/1'
    Then I should see the text 'Tag 1'
    And I should see the text 'Note 1'
    And I should not see the text 'Private Note 1'
    And I should see the text 'Note 4'
    And I should not see the text 'Private Note 4'
        
  @active
  Scenario: Click tag from '/'
    Given I am on '/'
    When I click 'Tag 1'
    Then I should be redirected to '/tags/1'
  
  @active
  Scenario: Click tag from '/user/home'
   Given I have authenticated from '/'
   And I load '/users/1'
   When I click 'Tag 1'
   Then I should be redirected to '/tags/1'
  
  @active
  Scenario: Click tag from note
    Given I am on '/notes/1'
    When I click 'Tag 1'
    Then I should be redirected to '/tags/1'
  
  @pending
  Scenario: Search for tag
    Given I am on '/'
    When I enter 'Tag 1' into '#search'
    And I press the button 'Search'
    Then I should be redirected to '/tags/1'