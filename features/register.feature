Feature: register

    Scenario: Creating an account
        Given I am on the register page
        When I fill in "userhandle" with "user_test"
        When I fill in "email" with "user_test@gmail.com"
        When I fill in "password" with "123123"
        When I fill in "repeat_password" with "123123"
        When I press "submit" within "form"
        Then I should be on the login page
        Given I am on the login page
        When I fill in "useremail" with "user_test@gmail.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should be on the Home page
        Then I should see "Log Out"
        
    Scenario: Trying to create the same account       
        Given I am on the register page
        When I fill in "userhandle" with "user_test"
        When I fill in "email" with "user_test@gmail.com"
        When I fill in "password" with "123123"
        When I fill in "repeat_password" with "123123"
        When I press "submit" within "form"
        Then I should be on the login page
        Then I should see "An account with that information already exists."
        
   Scenario: Returning to login page
        Given I am on the register page
        When I press "login page" within "form"
        Then I should be on the login page
        
        