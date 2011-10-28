Feature: Footer bar
  @active
  Scenario: Footer from landing page
    Given I am on the home page
    Then I should see '#footer'
    And I should see '#about'
    And I should see '#tos'
    And I should see '#contact'
    And I should see the text '© Ryan Michael'
    
  @active
  Scenario: Click About from footer
    Given I am on the home page
    When I click 'About' from inside '#footer'
    Then I should be redirected to the about page
    
  @active
  Scenario: Click TOS
    Given I am on the home page
    When I click 'Terms of Service'
    Then I should be redirected to the terms of service
    
  