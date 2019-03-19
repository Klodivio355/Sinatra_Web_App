
Feature: Login
    
    Scenario: correct login credentials
        Given I am on the home page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should see "You are logged in"
    
    Scenario: incorrect login credentials
        Given I am on the home page
        When I fill in "useremail" with "nosense"
        When I fill in "password" with "nop"
        When I press "Login" within "form"
        Then I should see "Login"
   