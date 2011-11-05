Feature: User login
  @active
  Scenario: Successful login from /
    Given I am on the home page
    When I click 'Login'
    And I login as valid user 'Alice'
    Then I should be redirected to the user home page
    And I should see '#logout'
    
  @active
  Scenario: Failed login from /
    Given I am on the home page
    When I click 'Login'
    And I login as invalid user 'Bob'
    Then I should be redirected to the sign-in page
    And I should see the text 'Invalid email or password'
    
  @pending
  Scenario: Login from tag
    Given I am on tag page 1
    When I click 'Login'
    And I login as valid user 'Alice'
    Then I should be redirected to tag page 1
    And I should see the text 'Alice'
    And I should see '#logout'
    
  @pending
  Scenario: Login from search
    Given I am on '/search?q=foo'
    When I click 'Login'
    And I login as valid user 'Alice'
    Then I should be redirected to '/search?q=foo'
    And I should see the text 'Alice'
    And I should see "#logout"
    
  @pending
  Scenario: Login from new note
    Given I am on '/notes/new'
    And I have entered a new note
    When I click 'Save'
    Then I should be redirected to '/users/sign_in'
    And I should see 'Sign in to save your note'
    
  @pending
  Scenario: Successful login after note creation
    Given I am on '/notes/new'
    And I have entered a new note
    And I click 'Save'
    When I login as valid user 'Alice'
    And I should see the text 'Note added'
    And I should see the text 'Alice'
    
  @pending
  Scenario: Failed login after note creation
    Given I am on '/notes/new'
    And I have entered a new note
    And I click 'Save'
    When I login as invalid user 'Bob'
    Then I should see the text 'Login Unsuccessful'
    And I should see the text 'Sign in to save your note'
    
  @active
  Scenario: Step check
    Given I have authenticated from the home page
    Then I should be redirected to the user home page