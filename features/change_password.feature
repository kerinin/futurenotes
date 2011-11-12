Feature: Change user password
  @active
  Scenario: Change password
    Given I have authenticated from the home page
    And I click 'Change Password'
    And I type 'new_password' into 'New Password'
    And I type 'new_password' into 'New Password Confirmation'
    And I type 'password123' into 'Current Password'
    And I press the button 'Update'
    Then I should be redirected to the user home page
    And I should see the text 'You updated your account successfully'
    
    