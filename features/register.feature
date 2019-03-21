Feature: register

    Scenario: Creating an account
        Given I am on the register page
        When I fill in "userhandle" with "test03@qq.com"
        When I fill in "email" with "test103@qq.com"
        When I fill in "password" with "123123"
        When I fill in "repeat_password" with "123123"
        When I press "submit" within "form"
        Then I should be on the login page

   Scenario: Returning to login page
        Given I am on the register page
        When I press "login page" within "form"
        Then I should be on the login page
        
        